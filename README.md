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

### Example 3: One to One

In case you missed it, Example 2 is on the manytomany branch. You do not need to do it in order
to complete this exercise. They're separate.

Follow the examples on the onetoone branch. Use them as a guide to recreate the same models
and migrations in your associations app.

Before you being, read and review the following from the onetoone branch:
* The migrations files.
* The model files

Now that you've read those files, do a small bit of research in the rails documentation
to understand the commands and methods used. 

Let's recreate those models using these commands:
```bash
rails g model User name
rails g model Address address user:belongs_to
rails db:migrate
```

Next:
- Open app/models/user.rb
- Add the following to the user class: `has_one :address`
- Open app/models/address.rb and take a look. It should have `belongs_to :user`

Open your rails console terminal.
```bash
samir = User.create(name: 'Samir')
samir_address = Address.create(address: '123 Main Street, Louisville, KY', user: samir)

samir.address
samir_address.user

# Nothing stops us from doing this, however:
chen = User.create(name: 'Chen')
chen.address = samir_address

# Check the association on Address:
samir_address.user

# ...it's still Samir!
```

With a one to one, we can assign the address to a different user or a user to a different 
address. But there can only be one user assigned to `Address.user`, always.

If you want to prevent assigning and address to `User.address` you can add this to your User model:

```ruby
class User < ApplicationRecord
  has_one :address
  attr_readonly :address
end
```

Reload your console and try the following:
```bash
olivia = User.create(name: 'Olivia')
olvia.address = Address.find(1)
```
This should raise an error now. By configuring your models in this way, you can ensure
that one and only 1 user has any given address.

This prevents you from setting the same address on multiple users.

So in review:
- An `Address` belongs to one `User` at a time. 
- It can be reassigned to a different user -- but it's still just 1 user.
- A `User` model has one `Address`.
- Using the `attr_readonly` attribute, `User.address` cannot be altered from the `User`


Summary:
- Use the rails generator to create your models.
- Update your models files to include `has_one` as appropriate

### More Practice

A `Software` belongs to `Company`.
A `Company` has one `Software`.

Within this application, create the following one-to-many association:
* Software: name (string), company
* Company: name (string)

Make sure that `Company.software` is read-only!

Use the cheatsheet and the examples above to help you along the way. To get an in-depth
explanation of rails models, migrations and associations, always refer first to the
official documentation:

- http://guides.rubyonrails.org/association_basics.html
