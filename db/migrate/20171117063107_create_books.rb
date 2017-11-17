class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title

      # This is how we build a one to many association in the *database*
      # Open app/models/book.rb
      t.belongs_to :author, foreign_key: true

      t.timestamps
    end
  end
end
