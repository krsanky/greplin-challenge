# Level 1
# 
# ----------------------------------------
# 
# Embedded in this block of text is the password for level 2.
# The password is the longest substring that is the same in reverse.
# 
# As an example, if the input was "I like racecars that go fast"
# the password would be "racecar".


IO.puts "level 1"

text = String.downcase(File.read! '../gettysburg.txt')
IO.puts text


