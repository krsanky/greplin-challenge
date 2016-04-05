# Level 1
# 
# ----------------------------------------
# 
# Embedded in this block of text is the password for level 2.
# The password is the longest substring that is the same in reverse.
# 
# As an example, if the input was "I like racecars that go fast"
# the password would be "racecar".

defmodule Level1 do
  import Enum, only: [chunk: 3, find: 2, reverse: 1]
  import String, only: [codepoints: 1]

  # find one reversible seq of length 'len' in 's'
  def find_rev_seq(s, len) do
    # get all consecutive seqs of length 'len' in 's', and find the 1st on that is palindrome
    #seq = codepoints(s) |> chunk(len, 1) |> find(fn(x) -> x == reverse(x) end)
    seq = codepoints(s) |> chunk(len, 1) |> find(&(&1 == reverse(&1)))
    if seq do
      Enum.join(seq) # convert back to string
    else
      nil
    end
  end

  def max_rev_seq(s, len) do
    subs = find_rev_seq(s, len)
    if subs do
      subs
    else
      max_rev_seq(s, len-1)
    end
  end

  def max_rev_seq(s) do
    max_rev_seq(s, String.length(s))
  end

end

IO.puts "level 1"
text = File.read!('../gettysburg.txt') |> String.downcase 
IO.puts(Level1.max_rev_seq(text))

