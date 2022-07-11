class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :length, default: 0
      t.boolean :in_print, default: false

      t.timestamps
    end
  end
end
