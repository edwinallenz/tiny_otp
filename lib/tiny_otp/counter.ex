defmodule TinyOtp.Counter do
  use GenServer

  def start_link(start_value) do
    {:ok, pid} = GenServer.start_link(__MODULE__, start_value, name: __MODULE__)
    IO.inspect("Startind GenServer with pid #{inspect pid}  -- #{inspect start_value}")
    {:ok, pid}
  end

  def init(start_value) do
    IO.puts (start_value)
    {:ok, start_value}
  end

  def add(value) do
    GenServer.cast(__MODULE__, {:add, value})
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def reset(value) do
    GenServer.cast(__MODULE__, {:reset, value})
  end

  def handle_cast({:add, value}, state) do
    new_state = value + state
    {:noreply, new_state}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:reset, value}, new_state) do
    {:noreply, new_state}
  end
end
