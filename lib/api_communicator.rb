require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  films = []
  response_hash["results"].each do |character|
    if character["name"] == character_name
      films = character["films"]
    end
  end

  array_2 = []
  films.each do |film|
    film_response = RestClient.get(film)
    film_response_hash = JSON.parse(film_response)
    array_2 << film_response_hash
  end
  array_2
end


  # iterate over the response hash to find the collection of `films` for the given

  #   `character`

  films = []
  response_hash["results"].each do |character|
    if character["name"] == character_name
      films = character["films"]
    end
  end

  film_arr = []

  films.each do |film|
    film_response_string = RestClient.get(film)
    film_response_hash = JSON.parse(film_response_string)
    film_arr << film_response_hash
  end

  film_arr

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film


  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film


  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
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

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
