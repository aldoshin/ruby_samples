# Define a method hello(name) that takes a string representing a name and 
# returns the string "Hello, " concatenated with the name.
def hello(name)
	"Hello, #{name}"
end

# Define a method starts_with_consonant?(s) that takes a string and returns 
# true if it starts with a consonant and false otherwise. (For our purposes, a 
# consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for 
# both upper and lower case and for nonletters!
def starts_with_consonant?(s)
	/^[^aeiou]/i.match(s)
end

# raise "Carlos" unless starts_with_consonant? "Carlos"
# raise "Testing" unless starts_with_consonant? "Testing"
# raise "albert" if starts_with_consonant? "albert"
# raise "Eugenia" if starts_with_consonant? "Eugenia"

# Define a method binary_multiple_of_4?(s) that takes a string 
# and returns true if the string represents a binary number 
# that is a multiple of 4. NOTE: be sure it returns false if the string is not
# a valid binary number!
def binary_multiple_of_4?(s)
	/(0|1)+00$/i.match(s)
end