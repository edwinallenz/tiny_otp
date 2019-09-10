defmodule TinyOtpTest do
  use ExUnit.Case
  doctest TinyOtp

  test "greets the world" do
    assert TinyOtp.hello() == :world
  end
end
