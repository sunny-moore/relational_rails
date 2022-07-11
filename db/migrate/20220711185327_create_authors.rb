class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :awards, default: 0
      t.boolean :deceased, default: false

      t.timestamps
    end
  end
end
