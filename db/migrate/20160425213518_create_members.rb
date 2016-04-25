class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.references :organization, index: true, foreign_key: true
      t.text :summary
      t.text :full_text_bio
      t.text :url
      t.text :picture

      t.timestamps null: false
    end
  end
end
