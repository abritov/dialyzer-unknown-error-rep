defmodule HexRegistryTest do
  use ExUnit.Case
  doctest HexRegistry

  test "greets the world" do
    assert HexRegistry.hello() == :world
  end
end
