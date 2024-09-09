class CreateCirculars < ActiveRecord::Migration[7.0]
  def change
    create_table :circulars do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
