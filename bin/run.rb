#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

system "clear"
welcome

while true
  character = get_character_from_user
  if character == "exit"
    puts "\nFor Nothing... Goodbye!"
    break
  end
  puts "Searching....."
  show_character_movies(character)
end
