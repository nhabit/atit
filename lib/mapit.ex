defmodule Mapit do
  defmacro atit(data_structure_string) do
    String.split(data_structure_string, "->") |> Enum.map(&convert_to/1)
  end

  def convert_to(string) do
    cond do
      string =~ ~r/\{.*}/ ->
        mapped = Regex.named_captures(~r/\{:(?<key>.*)\}/,string)
        String.to_atom mapped["key"]
      string =~ ~r/\[.*\]/ ->
        mapped = Regex.named_captures(~r/\[(?<num>.*)\]/,string)
        index = String.to_integer mapped["num"]
        quote do Access.at(unquote(index)) end )
      end
  end

end
