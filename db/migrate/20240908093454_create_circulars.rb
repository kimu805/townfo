class CreateCirculars < ActiveRecord::Migration[7.0]
  def change
    create_table :circulars do |t|

      t.timestamps
    end
  end
end
