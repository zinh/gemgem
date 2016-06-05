class CreateThingsAndComments < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.text :name
      t.text :description
      t.timestamps
    end

    create_table :comments do |t|
      t.text :body
      t.integer :thing_id
      t.timestamps
    end
  end
end
