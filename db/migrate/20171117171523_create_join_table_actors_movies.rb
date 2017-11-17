class CreateJoinTableActorsMovies < ActiveRecord::Migration[5.1]
  def change
    # Your migration command created this for you based on how you named the migration!
    # Optionally, in your own migration file, you can uncomment the first line of the loop.
    # Indexing speeds up your app.
    # When done, open the Actor and Movie model files to add the associations to them.
    # Be sure to follow the example provided in the Github repository manytomany branch
    create_join_table :actors, :movies do |t|
      t.index [:actor_id, :movie_id]
      # t.index [:movie_id, :actor_id]
    end
  end
end
