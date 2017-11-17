# Rails Associations

This is a continuation from:
- associations
- manytomany

You should already have the 'associations' app downloaded so you do not need to download
the files here. 

Instead, follow the example below to recreate the new models and migrations in your current app.

### Example 3: One to One

In case you missed it, Example 2 is on the manytomany branch. 

Before you begin, read and review the following from the onetoone branch:
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
reload!
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
* Company: name (string)
* Software: name (string), company

Make sure that `Company.software` is read-only!

Use the cheatsheet and the examples above to help you along the way. To get an in-depth
explanation of rails models, migrations and associations, always refer first to the
official documentation:

- http://guides.rubyonrails.org/association_basics.html
