# Cheat Sheet

Below are some quick commands and shortcuts for:
* Rails
* Sublime Text
* Command Line
* Configuration Gotchas

Try to become proficient at using them!

```shell
# View the help docs on the rails generator.
# Navigate using the spacebar and type `q` to close.
rails generate -h | less

# Create a new Rails app
# The -T flag instructs rails not to produce tests. -d selects a database
rails new appname -T -d postgresql

# Database creation
rails db:create

# When you create new models, run migrations
rails db:migrate

# Generate ...
rails g model ModelName
rails g controller Controllersname
rails g migration MigrationName

# Other
rails console

# If you download an existing app, load the database schema
rails db:schema:load
```

# Sublime 

Mac/Windows/Linux users: Be sure to substitute CMD or CTRL / ALT or OPT as appropriate!

```bash
# Save should be auto but if not:
CTRL + S

# New file
CTRL + N

# Hide/Show sidebar
CTRL K + B

# Split view into columns/rows. Experiment using numbers 1-8!
SHIFT + ALT + 2

# Delete a line of code
CTRL + SHIFT + K

# Copy a line of code
CTRL + X

# Duplicate a line of code
CTRL + SHIFT + D

# New line
CTRL + ENTER

# Indent selected lines
CTRL + ]

# Unindent selected lines
CTRL + [
```

More: http://docs.sublimetext.info/en/latest/reference/keyboard_shortcuts_win.html


# Rails Gotchas

Depending on your operating system and various application versions, you may find that you need
to tweak some configurations.

- Use config/database.yml tell rails how to connect to your database. You may need to add the username/password to the `development` section if you get database connection errors.
- When using the rails console, you may be required to run `Modelname.connection` to interact with Rails. Usually you'll see an error message that tells you exactly this.
