require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  char_hash = find_character(response_hash, character_name)
  puts "Character #{char_hash["name"]} found!"
  film_urls_to_hashes(char_hash["films"])
end

def find_character (response, character_name)
  response["results"].each do |character|
      # if character["name"] == character_name
      if character_name == character["name"].downcase
        return character
      end
  end
end


def film_urls_to_hashes (film_urls)
  film_arr = []
  film_urls.each do |film|
    film_response_string = RestClient.get(film)
    film_arr << JSON.parse(film_response_string)
  end
  film_arr
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


def print_movies(films) # film_arr
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts "#{film["title"]}, released #{film["release_date"]}"
  end
end


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)

end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
