class ChangeUserIdNullInCirculars < ActiveRecord::Migration[7.0]
  def change
    change_column_null :circulars, :user_id, true
  end
end
