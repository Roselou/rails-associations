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
* Owner: name (string)
* Car: make (string), year (string), owner

Use the cheatsheet and the examples above to help you along the way. To get an in-depth
explanation of rails models, migrations and associations, always refer first to the
official documentation:

- http://guides.rubyonrails.org/association_basics.html

Next, visit this Github repository and take a look at the manytomany branch. It will have
more instructions, examples, and exercises.

You can do those exercises in this very same associations app! Use the examples on the 
manytomany branch to help you complete them.
