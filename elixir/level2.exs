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
# Step 2. The password for level 3 is the sum of prime divisors of (X + 1).
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
        |> &not/1
        #|> (&(not &1)).()
    end
  end
end

IO.puts "level 2..."
IO.puts(Level2.prime?(24))
#(defn prime? [num]
#  "checks if number is prime"
#  (some true? (for [n primes :while (<= n num)] (= n num))))
#
#(defn next-fibo [num]
#  "return the next fibo num *greater than* num"
#  (some #(if (> % num) %) (fibs)))
#
#(defn next-fibo-prime [num]
#  (loop [f (next-fibo num)]
#    (if (prime? f)
#      f
#      (recur (next-fibo f)))))
#
#(defn first-prime-div [num]
#  (some #(if (= (mod num %) 0) %) primes))
#
#(defn prime-divs [num]
#  (loop [num num divs []]
#    (let [div (first-prime-div num)]
#      ;;(println (str "[num div divs]: " num " " div " " divs))
#      (if (>= div num)
#        (conj divs div)
#        (recur (/ num div) (conj divs div))))))
#
#(defn run2 []
#  (do
#    ;;1st part:
#    (println (str "(next-fibo-prime 227000) = " (next-fibo-prime 227000)))
#    ;;(next-fibo-prime 227000) = 514229
#
#    (println (str "answer: " (apply + (distinct (prime-divs (+ 514229 1))))))))





