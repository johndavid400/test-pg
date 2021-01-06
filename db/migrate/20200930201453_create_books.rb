class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
