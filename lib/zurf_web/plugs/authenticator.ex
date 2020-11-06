defmodule ZurfWeb.Plugs.Authenticator do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _) do
    check_user_session = conn |> get_session(:current_user)
    assign(conn, :user_session, check_user_session)
  end
end
