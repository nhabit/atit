defmodule MapitTest do
  use ExUnit.Case
  doctest Mapit

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "no truth" do
    our_tasty_map =
      %{fields: [
        %{name: "rank", rank: 0},
        %{name: "location", location: ""}],
      type: "how-common-is-surname"}
        |> put_in([:fields, Access.at(0), :rank], 100)
        |> put_in([:fields, Access.at(1), :location], "Weston Super Mare")

    assert our_tasty_map ==
        %{fields: [
          %{name: "rank", rank: 100},
          %{name: "location", location: "Weston Super Mare"}],
        type: "how-common-is-surname"}
  end


end
