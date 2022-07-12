class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :awards, null: false, default: 0
      t.boolean :deceased, null: false, default: false

      t.timestamps
    end
  end
end
