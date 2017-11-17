# Rails Associations

Download this repository! Open:

* Code editor
* 3 terminal tabs: 1 for your rails server, rails console, and regular command line
* Open your cheatsheet for quick commands!
* Open a browser tab to: 

### Setup

```shell
bundle install
rails db:create
```
### One to Many

```ruby
rails g model Author first_name last_name books:has_many
rails g model Book title author:belongs_to
```