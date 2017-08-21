require "sinatra"
require "pg"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect '/actors'
end


get "/actors" do
  db_connection do |conn|
    @actor_list = conn.exec("SELECT * FROM actors ORDER BY name ASC")
  end

  erb :'actor/index'
end


get "/movies" do
  db_connection do |conn|
    @movie_list = conn.exec("SELECT  movies.title, movies.year, movies.rating, movies.genre_id, movies.studio_id, movies.id, genres.name AS genre, studios.name AS studio FROM movies INNER JOIN genres ON movies.genre_id = genres.id INNER JOIN studios ON movies.studio_id = studios.id ORDER BY title ASC")
  end

  erb :'movies/index'
end

get "/actors/:id" do
  actor_id = params[:id]
  sql = "SELECT movies.id, movies.title, cast_members.character, actors.name FROM movies INNER JOIN cast_members ON movies.id = cast_members.movie_id INNER JOIN actors ON actors.id = #{actor_id} WHERE actor_id = #{actor_id}"

  db_connection do |conn|
    @actor_info = conn.exec(sql)
  end
  erb :'actor/show'
end

get "/movies/:id" do
  movie_id = params[:id]

  sql = "SELECT movies.title, movies.year, movies.synopsis, movies.rating, movies.genre_id, movies.studio_id, genres.name AS genre, studios.name AS studio, movies.id FROM movies INNER JOIN genres ON movies.genre_id = genres.id INNER JOIN studios ON movies.studio_id = studios.id WHERE movies.id = #{movie_id};"

  sql_actors = "SELECT cast_members.character, actors.name, actors.id FROM movies INNER JOIN cast_members ON cast_members.movie_id = movies.id INNER JOIN actors ON actors.id = cast_members.actor_id WHERE movies.id = #{movie_id};"
  db_connection do |conn|
    @movie_info = conn.exec(sql)
    @movie_char = conn.exec(sql_actors)
  end
  erb :'movies/show'
end
