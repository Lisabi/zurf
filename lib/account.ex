defmodule Account do
  alias Zurf.{Repo, User}

  def signup_changeset do
    User.changeset(%User{})
  end

  def signup_with_email_password(%{"user" => params}) do
    changeset = User.changeset(%User{}, params)
    Repo.insert(changeset)
  end

  def login(email, password) do
    error_message = "Email and password combination does not match"

    case Zurf.Repo.get_by(User, email: email) do
      %User{} = user ->
        if Bcrypt.verify_pass(password, user.password) do
          {:ok, user}
        else
          {:error, error_message}
        end

      nil ->
        # do fake verify
        {:error, error_message}
    end
  end
end
