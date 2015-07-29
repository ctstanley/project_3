class CreateBrews < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
