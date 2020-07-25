def welcome
  # puts out a welcome message here!
  puts " "
  puts "*** S T A R  W A R S ***"
  puts " "
  puts " "
end

def get_character_from_user
  puts "Please enter a character name:"
  puts "> "
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp.downcase
  puts " "
  puts " "
  input
  end
