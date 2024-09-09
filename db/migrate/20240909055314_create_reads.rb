class CreateReads < ActiveRecord::Migration[7.0]
  def change
    create_table :reads do |t|
      t.references :user,          null: false, foreign_key: true
      t.string     :readable_type, null: false, polymorphic: true
      t.boolean    :complete,      null: false, default: false
      t.timestamps
    end
  end
end
