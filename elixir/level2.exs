# Level 2
#
# ----------------------------------------
#
# Congratulations.  You have reached level 2.
#
# To get the password for level 3, write code to find the first prime
# fibonacci number larger than a given minimum.  For example, the first
# prime fibonacci number larger than 10 is 13.
#
# When you are ready, go here or call this automated
# number (415) 799-9454.
#
# You will receive additional instructions at that time.  For the second portion
# of this task, note that for the number 12 we consider the sum of the prime divisors
# to be 2 + 3 = 5.  We do not include 2 twice even though it divides 12 twice.
#
# ---- next-part:
# Step 1. Use your code to compute the smallest prime fibonacci number
# 	greater than 227,000.  Call this number X.
#
# Step 2. The password for level  the sum of prime divisors of (X + 1).
#                                                                (parens i added)
# Note: If you call the number instead, it will check your answer for step 1.

defmodule Level2 do
  #import Enum, only: [chunk: 3, find: 2, reverse: 1]

  def prime?(number) do
    import Enum
    case number do
      1 -> false
      2 -> true
      3 -> true
      other -> to_list(2..round(:math.sqrt(other))) 
        |> map(&(rem(other, &1)==0)) 
        |> any? 
        |> (&(not &1)).()
    end
  end

  def fibs do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end

  # not used for answer
  def next_fib(num) do
    Level2.fibs |> Stream.filter(&(&1 > num)) |> Enum.take(1) |> List.first
  end

  def next_prime(n) do
    Stream.iterate(n+1, &(&1 + 1)) 
      |> Stream.filter(&prime?/1) 
      |> Enum.take(1) 
      |> List.first
  end

  def next_prime_fib(num) do
    Level2.fibs 
      |> Stream.filter(fn n -> (n > num) && (prime? n) end) 
      |> Enum.take(1) 
      |> List.first
  end      

  def primes do
    Stream.unfold({2, 3}, fn {a, b} -> {a, {b, next_prime(b)}} end)
  end

  def prime_divs(n) do
    primes
      #|> Stream.each(&IO.inspect/1)
      |> Stream.take_while(&(&1 < n))
      |> Stream.filter(fn p -> rem(n, p) == 0 end)
      |> Enum.to_list
  end

  # Step 1. Use your code to compute the smallest prime fibonacci number
  # 	greater than 227,000.  Call this number X.
  def target_X do
    next_prime_fib(227_000)
  end

  # takes some time
  def answer do
    target_X + 1 
      #|> IO.inspect
      |> prime_divs
      |> Enum.to_list
      #|> IO.inspect
      |> Enum.sum
  end

  def test do
    require Integer
    IO.puts(Level2.prime?(24))
    Level2.fibs |> Enum.take(9) |> IO.inspect
    Level2.fibs |> Stream.filter(&Integer.is_odd/1) |> Enum.take(3) |> IO.inspect
    Level2.next_fib(12) |> IO.inspect
    Level2.next_fib(21) |> IO.inspect
    Level2.next_fib(333) |> IO.inspect
    Level2.next_fib(9333) |> IO.inspect
    Level2.next_prime_fib(12) |> IO.inspect
    Level2.next_prime_fib(21) |> IO.inspect
    Level2.next_prime_fib(333) |> IO.inspect
    Level2.next_prime_fib(9333) |> IO.inspect
    Level2.primes |> Enum.take(10) |> IO.inspect
    Level2.next_prime(40) |> IO.inspect
    Level2.next_prime(4) |> IO.inspect
    Level2.next_prime(400) |> IO.inspect
    Level2.next_prime(78) |> IO.inspect
    Level2.primes |> Enum.take(15) |> IO.inspect
    target_X |> IO.inspect
    prime_divs(10) |> IO.inspect
    prime_divs(90) |> IO.inspect
    prime_divs(393) |> IO.inspect
  end

end

IO.puts "level 2..."
#Level2.test
Level2.answer |> IO.inspect

