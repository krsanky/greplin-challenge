# Level 3
# 
# ----------------------------------------
# 
# Congratulations.  You have reached the final level.
# 
# For the final task, you must find all subsets of an array
# where the largest number is the sum of the remaining numbers.
# For example, for an input of:
# 
# (1, 2, 3, 4, 6)
# 
# the subsets would be
# 
# 1 + 2 = 3
# 1 + 3 = 4
# 2 + 4 = 6
# 1 + 2 + 3 = 6
# 
# Here is the list of numbers you should run your code on.
# The password is the number of subsets.  In the above case the
# answer would be 4.
 
# https://www.youtube.com/watch?v=jpXNlOxupmM
#email Dave Thomas and ask about 2003 oopsla ... is he talking about the 96 one in the link above?
#https://www.youtube.com/watch?v=VipKX58VGhs

defmodule Level3 do

  # i stole comb from rosettacode:
  def comb(0, _), do: [[]]
  def comb(_, []), do: []
  def comb(m, [h|t]) do
    (for l <- comb(m-1, t), do: [h|l]) ++ comb(m, t)
  end
     
  # determine if the largest num the sum of the rest.
  def set_is_sum(list) do
    [max | rest] = list 
    |> Enum.sort 
    |> Enum.reverse
    max == (rest |> Enum.sum)
  end

  def find_sumsets(list) do
    #find subsets of length list (there's only one)
    set_is_sum(list) |> IO.inspect

    #find subsets of length-1 list (there length many)
    comb(Enum.count(list)-1, list) 
    |> Enum.filter(fn l -> set_is_sum(l) end)
    |> IO.inspect
  end

  def read_numbers do
    File.read!('../numbers.csv')
    |> String.split([",", " "], trim: true)
    #|> IO.inspect
    |> Enum.map(fn s -> String.to_integer(s) end)
    #|> IO.inspect
    |> Enum.to_list
  end

  def test do
    read_numbers |> set_is_sum |> IO.inspect
    [1,2,3,6] |> set_is_sum |> IO.inspect
    read_numbers |> find_sumsets
  end

  def answer do
  end

end

IO.puts "level 3..."
Level3.test
#Level3.answer |> IO.inspect

