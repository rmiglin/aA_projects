'''
create_table "actors", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_actors_on_name"
  end

  create_table "castings", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "movie_id", null: false
    t.integer "ord", null: false
    t.index ["actor_id", "movie_id"], name: "index_castings_on_actor_id_and_movie_id", unique: true
    t.index ["actor_id"], name: "index_castings_on_actor_id"
    t.index ["movie_id"], name: "index_castings_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.integer "yr", null: false
    t.float "score", null: false
    t.integer "votes", null: false
    t.integer "director_id", null: false
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["title"], name: "index_movies_on_title"
  end
'''


def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :yr, :score)
    .where('yr BETWEEN 1980 AND 1989')
    .where('score BETWEEN 3 AND 5')

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
  .group(:yr)
  .having('MAX(score) <= 8')
  .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
     .select(:id, :name)
     .joins(:movies)
     .where(movies: {title: title})
     .order('castings.ord ASC')

end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie 
    .select('DISTINCT movies.id, movies.title, actors.name')
    .joins(:actors)
    .joins(:castings)
    .where(castings: {ord: 1})
    .where('movies.director_id = castings.actor_id')

end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .select(:id, :name, 'COUNT(castings.actor_id) AS roles')
    .joins(:castings)
    .where.not(castings: {ord: 1})
    .group('actors.id')
    .order('roles DESC')
    .limit(2)

end
