class CreateSoftwares < ActiveRecord::Migration[5.1]
  def change
    create_table :softwares do |t|
      t.string :name
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
