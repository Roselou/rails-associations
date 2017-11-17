class Movie < ApplicationRecord
  # Our many to many association is complete by adding this line to our model.
  # Add it to your model.
  has_and_belongs_to_many :actors
end
