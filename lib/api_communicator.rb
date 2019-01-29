require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  film_urls = []
  film_info = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |info|
      if info["name"].downcase == character_name
        info["films"].each do |url|

      response_url = RestClient.get(url)
      film_info << JSON.parse(response_url)

      end
    end
  end
    film_info
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
puts "*" * 20
puts "Film Titles:"
  films.each do |element|
    puts element["title"]
  end
  puts "*" * 20
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
