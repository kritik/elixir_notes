#:observer.start - will start stats
# Words.count(File.stream!("war-and-peace.txt"))
# Words.count_lazy(File.stream!("war-and-peace.txt"), Stream)
defmodule Words do
  def count(lines) do
    lines
    |> Enum.flat_map(&String.split/1)
    |> Enum.map(&String.downcase/1)
    |> Enum.map(&remove_special_chars/1)
    |> Enum.reduce(%{}, &count_word/2)
  end

  def count_lazy(lines, mod) do
    lines
    |> mod.flat_map(&String.split/1)
    |> mod.map(&String.downcase/1)
    |> mod.map(&remove_special_chars/1)
    |> Enum.reduce(%{}, &count_word/2)
  end

  defp remove_special_chars(string) do
    string
    |> String.normalize(:nfd) # utf to ascii
    |> String.replace(~r/[^A-z\s]/u, "") # remove non-ascii
  end

  defp count_word(word, map) do
    # Map.update(map, word, 1, fn (a)-> a+1 end)
    Map.update(map, word, 1, &(&1 + 1))
  end
end
