# Rails Associations

This is part 2. Visit the associations branch to review one to many associations. 

If continuing, do not download this branch. Keep working in the same 'associations' app and follow the
examples below to add the new models and migrations.

## Example 2: Many to Many (intransitive)

The following a slightly simpler approach to creating a many to many relationship. There are
some key differences between this approach and [that approach](https://github.com/SF-WDI-LABS/rails-migrations-and-associations). We'll do a comparison at the end.

This will be your guide to recreate the following models and associations.

In the [Github repository](https://github.com/SF-WDI-LABS/rails-migrations-and-associations/tree/manytomany), review the following files in the manytomany branch:

* create_actors migration
* create_movies migration
* create_join_table migration
* app/models/actor.rb
* app/models/movie.rb

Recreate the `Actor` and `Movie` models in your associations app. The instructions in each file will walk you through
it and explain how things work. Run these commands to create models and migrations:

```shell
rails g model Actor name
rails g model Movie title
rails g migration CreateJoinTableActorsMovies actors movies
rails db:migrate
```

Open the `create_join_table` migration file and take a peek. Notice the new helper method `create_join_table`.
This is Rails way of taking care of your join table for you. 

This approach to many to many is most useful when you do not need to use or interact directly with the join table.

- Open your model file for `Actor`. 
- Add `has_and_belongs_to_many :movies`. 
- Open your model file for `Movie` and do the same: `has_and_belongs_to_many :actors`

Open your rails console:
```bash
gadot = Actor.create(name: 'Gal Gadot')
wonder_woman = Movie.create(title: 'Wonder Woman')

gadot.movies << wonder_woman

pine = Actor.create(name: 'Chris Pine')
wonder_woman.actors << pine
```

Let's take a look at what's happening behind the scenes in the join table. You can use the database console:
```bash
# In a new terminal window, navigate to our rails app folder. Then type:
rails dbconsole

# View a list of all the current tables:
\dt

# View the contents of the join table:
select * from actors_movies;
```

Remember that no modifications to your database should be made on the `dbconsole`. Use the rails
application to update models through migrations. Always.

So in review, the many to many works like this:
* Actors have and belong to many movies.
* Movies have and belong to many actors.
* Join tables are used to associate the two.

Many to many associations always require a join table. 

Summary:
* Use the rails generator to create a models (optionally, include basic fields for them)
* Use the generator to create a migration to for a join table
* Run the migrations
* Open the model files and add the `has_and_belongs_to_many` association to each.

__Comparison to Transitive Approach__

In the first lesson our associations looked more like this: (link to example)
In it, we used `belongs_to` and `through` to describe the associations within our models.
Our migrations were also different, describing each column and type with `references` and `foreign_key`.

Both approaches accomplish the same basic thing. But the transitive approach is best used when you need to use the join table directly within your app.

But it's also a good way to make the workings of the many to many relationship more transparent.

### Practice

A `Student` has and belongs to many `Course`s.
A `Course` has and belongs to many `Students`s.

Within this application, create the following many-to-many association:
* Student: name (string)
* Course: title (string)

Use the cheatsheet and the examples above to help you along the way. To get an in-depth
explanation of rails models, migrations and associations, always refer first to the
official documentation:

- http://guides.rubyonrails.org/association_basics.html

Next, visit the Github repository and take a look at the onetoone branch. It will have
more instructions, examples, and exercises.

You can do those exercises in this very same associations app! Use the examples on the 
manytomany branch to help you complete them.
