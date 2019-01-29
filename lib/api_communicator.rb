require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  films_array = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |character_data|
    if character_data["name"].downcase == character_name
      character_data["films"].each do |api|
        films_string = RestClient.get(api)
        films_array << JSON.parse(films_string)
    end
  end
end
films_array
end





  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  if films.empty?
    puts "No films found for this character :( "
  else
    films.each do |film|
      puts '*' * 20
      puts ''
      puts 'Title: ' + film["title"]
      puts 'Director: ' + film["director"]
    end
  end
puts '*' * 20
end


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

# binding.pry

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
