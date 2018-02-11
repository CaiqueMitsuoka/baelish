defmodule Link.Generator do
  def perform(link) do
    String.slice(UUID.uuid5(:url, link), 0, 8)
  end

  def new_perform(link) do
    b62_encode(Integer.mod(to_sha_b16(link), limiter()))
  end

  def b62_encode(int) do
    to_b62(int, "")
  end

  def to_b62(0, acc) do
    acc
  end

  def to_b62(value, acc) do
    IO.puts(Integer.to_string(value))
    acc = "#{Enum.at(characters(), Integer.mod(value, 62))}#{acc}"
    to_b62(div(value, length(characters())), acc)
  end

  def to_sha_b16(link) do
    {b16, _} =
      :crypto.hash(:sha, link)
      |> Base.encode16()
      |> Integer.parse(16)

    b16
  end

  def limiter do
    length(characters())
    |> :math.pow(5)
    |> round
  end

  def characters do
    [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9"
    ]
  end
end
