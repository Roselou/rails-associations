# Rails Associations

Download this repository! Open:

* Code editor
* 3 terminal tabs: 1 for your rails server, rails console, and regular command line
* Open the cheatsheet for quick commands!
* Open a browser tab to: 

### Setup

```bash
bundle install
rails db:create

# Example models already exist! Just migrate them.
rails db:migrate
```
### Example 1: One to Many
These models are already created within this application. These were the commands used
to create them.

```bash
# Note that there are no migrations pending if you followed instructions above.
rails db:migrate:status

# Example of the commands used to create the migrations:
rails g model Author first_name last_name
rails g model Book title author:belongs_to
rails db:migrate
```

Review the migration file for `create_books` and read the comments.

Open a terminal tab to inspect our models:
```bash
rails console

s_king = Author.create(first_name: 'Stephen', last_name: 'King')

# Since books have only one author, we can add the association this way:
shining = Book.create(title: 'The Shining', author: s_king)

s_king.books
shining.author

# Now let's add a new book to the author's collection in a different way.
carrie = Book.create(title: 'Carrie')

# Since authors can write many books, we keep those books in an Arrray.
# You add books to that array the same way you'd add anything to an array:
s_king.books << carrie

Book.all
```
So in a one-to-many association:
- Book belongs to only one Author.
- Authors have many books.

Of course, we could use different associations to give books multiple authors. That would be
a many to many association which you'll get to practice later.

In review:
* Use the rails generator to create a model (optionally, include basic fields)
* Inspect the migration file and add any additional fields
* Run the migration
* Check your model files to add relationships if necessary (has_many and belongs_to)

### Practice

A `Car` belongs to one `Owner`.
An `Owner` has many `Car`s.

Within this application, create the following one-to-many association:
* Car: make (string), year (string), owner
* Owner: name (string)

Use the cheatsheet and the examples above to help you along the way. To get an in-depth
explanation of rails models, migrations and associations, always refer first to the
official documentation:

- http://guides.rubyonrails.org/association_basics.html

Next, visit the Github repository and take a look at the manytomany branch. It will have
more instructions, examples, and exercises.

You can do those exercises in this very same associations app! Use the examples on the 
manytomany branch to help you complete them.

## Example 2: Many to Many (intransitive)

The following a slightly simpler approach to creating a many to many relationship. There are
some key differences between this and the old lesson. We'll do a comparison at the end.

The manytomany branch will be your guide and you'll follow the example here to create the
same models and associations from the branch.

Please review the following files in the manytomany branch before continuing:

* create_actors migration
* create_movies migration
* create_join_table migration
* app/models/actor.rb
* app/models/movie.rb

Read all the comments. We'll use these examples to recreate the models and migrations in your app.

Recreate the Actor and Movie models in your associations app. The instructions in each file will walk you through
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

How can you inspect the join table? You can use the database console:
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

So in review, he many to many works like this:
* Actors have and belong to many movies.
* Movies have and belong to many actors.
* Join tables are used to associate the tables.

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
