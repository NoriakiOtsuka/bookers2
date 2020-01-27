class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :image_id
      t.string :title
      t.text :opinion
      t.integer :user_id

      t.timestamps
    end
  end
end
