defmodule ZurfWeb.V1.AuthController do
  use ZurfWeb, :controller
  alias Zurf.{Repo, User}
  import Ecto.Query

  def login(conn, params) do
    email = get_in(params, ["email"])
    password = get_in(params, ["password"])
    query = from u in User, where: u.email == ^email
    error_response = %{status: "error", message: "Your email or password is not correct"}

    case Repo.one(query) do
      %User{} = user ->
        if Bcrypt.verify_pass(password, user.password) do
          json(conn, %{status: "successful", message: "login successful"})
        else
          conn
          |> login_error_response(error_response)
        end

      _ ->
        conn
        |> login_error_response(error_response)
    end
  end

  defp login_error_response(conn, response) do
    conn
    |> put_status(404)
    |> json(response)
  end

  def signup(conn, params) do
    email = get_in(params, ["email"])
    password = get_in(params, ["password"])
    username = get_in(params, ["username"])

    changeset =
      User.changeset(%User{}, %{
        email: email,
        username: username,
        password: Bcrypt.hash_pwd_salt(password)
      })

    case Repo.insert(changeset) do
      {:ok, _} ->
        json(conn, %{status: "successful", message: "User signup successful"})

      {:error, _changeset} ->
        conn
        |> put_status(400)
        |> json(%{status: "error", message: "An error occured"})
    end
  end
end
