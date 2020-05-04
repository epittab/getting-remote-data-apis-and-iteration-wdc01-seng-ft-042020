require 'rest-client'
require 'json'
require 'pry'

def get_character_films_url(name, hash)

  film_array = []

  hash["results"].each do |char|
    if char["name"] == name
      film_array = char["films"]
    end
  end

  film_array
end

def get_film_data(url)

  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)

end

def get_character_data(name)

  base_url = 'http://swapi.dev/api/people'
  query_string = "/?search=#{name.gsub(" ","+")}"

  response_string = RestClient.get(base_url+query_string)
  response_hash = JSON.parse(response_string)
  
end



def get_character_movies_from_api(character_name)
  #make the web request

  response_hash = get_character_data(character_name)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, 
  film_url_array = get_character_films_url(character_name, response_hash)

    #make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`


  film_hash_array = film_url_array.map do | url |
    get_film_data(url)
  end

  
  #film_hash_array

  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list

  films.each_with_index do |film, ind|
    puts "#{ind+1}. #{film["title"]}"
  end

end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
