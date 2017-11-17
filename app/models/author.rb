class Author < ApplicationRecord
  # This was added manually by a developer.
  # This allows you to call the inverse relationship: Author.books
  # You must add this line to your model. Rails does not do this automatically.
  # Return to the 'Example 1' section of the README.md for more information.
  has_many :books
end
