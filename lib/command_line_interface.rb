def welcome
  # puts out a welcome message here!
  puts "Hey! Welcome to Star Wars!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  if input.empty?
    input = get_character_from_user
  end
  #puts "this was your input: #{input}"
  return input
end
