defmodule TinyOtp do
  use Application

  @moduledoc """
  Documentation for TinyOtp.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TinyOtp.hello()
      :world

  """

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {TinyOtp.Counter, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TinyOtp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
