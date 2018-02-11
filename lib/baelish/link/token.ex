defmodule Token do
  @characters String.graphemes("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

  def generate(link) do
    string_to_sha_b16(link)
    |> limit_number_of_characters
    |> encode_int_to_b64
  end

  defp limit_number_of_characters(link_b16) do
    Integer.mod(link_b16, limiter())
  end

  defp encode_int_to_b64(int) do
    to_b62(int, "")
  end

  defp to_b62(0, acc) do
    acc
  end

  defp to_b62(value, acc) do
    new_character = Enum.at(@characters, Integer.mod(value, num_characters()))

    acc = "#{new_character}#{acc}"

    next_value = div(value, num_characters())
    to_b62(next_value, acc)
  end

  defp string_to_sha_b16(link) do
    {b16, _} =
      :crypto.hash(:sha, link)
      |> Base.encode16()
      |> Integer.parse(16)

    b16
  end

  defp limiter do
    num_characters()
    |> :math.pow(5)
    |> round
  end

  defp num_characters do
    length(@characters)
  end
end
