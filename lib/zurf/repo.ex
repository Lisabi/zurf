defmodule Zurf.Repo do
  use Ecto.Repo,
    otp_app: :zurf,
    adapter: Ecto.Adapters.Postgres
end
