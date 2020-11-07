defmodule ZurfWeb.AuthController do
  use ZurfWeb, :controller

  def show(conn, _params) do
    conn
    |> put_layout("zurf_base.html")
    |> render("login.html", title: "Zurf - Login")
  end

  def signup(conn, _params) do
    changeset = Account.signup_changeset()

    conn
    |> put_layout("zurf_base.html")
    |> render("signup.html", title: "Zurf - Signup", changeset: changeset)
  end

  def login(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Account.login(email, password) do
      {:ok, user} ->
        put_session(conn, :current_user, %{
          username: user.username,
          id: user.id,
          email: user.email
        })
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, message} ->
        conn
        |> put_flash(:error, message)
        |> put_layout("zurf_base.html")
        |> render("login.html", title: "Zurf - Login")
    end
  end

  def signup_action(conn, params) do
    case Account.signup_with_email_password(params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_layout("zurf_base.html")
        |> render("signup.html", title: "Zurf - Signup", changeset: changeset)
    end
  end

  def delete(conn, _) do
    conn
    |> clear_session()
    |> configure_session(drop: true)
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
