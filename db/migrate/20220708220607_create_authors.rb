class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.boolean :deceased, default: false
      t.integer :awards, default: 0
      t.string :name

      t.timestamps
    end
  end
end
