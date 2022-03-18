require "json"
require "open-uri"

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=07de3c127ea28e5a662af7b76f458fca'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']

movies.each do |movie|
  Movie.create(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
