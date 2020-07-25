require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character = find_character(response_hash, character_name)
  film_urls_to_hash(character["films"])
end

def find_character(response, character_name)
  response["results"].each do |character|
    if character_name = character["name"].downcase
      return character
    end
  end
end

def film_urls_to_hash(film_urls)
  film_arr = []
  film_urls.each do |film|
    film_response_string = RestClient.get(film)
    film_arr << JSON.parse(film_response_string)
  end
  film_arr
end

def print_movies(films)
  films.each do |film|
    puts "^"*20
    puts film["title"]
    puts " "
    puts "Released: #{film["release_date"]}"
    puts " "
    puts " "
  end
end



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  system "clear"
  puts " "
  puts "*** S T A R  W A R S ***"
  puts " "
  puts "Films staring:"
  puts character
  puts " "
  puts " "
  print_movies(films)
end
