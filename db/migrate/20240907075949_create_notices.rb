class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.string     :title,   null: false
      t.text       :content, null: false
      t.date       :schedule
      t.integer    :tag_id,  null: false
      t.references :user,    null: false, foreign_key: true
      t.references :group,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
