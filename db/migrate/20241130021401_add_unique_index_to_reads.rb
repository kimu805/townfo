class AddUniqueIndexToReads < ActiveRecord::Migration[7.0]
  def change
    add_index :reads, [:user_id, :readable_type, :readable_id], unique: true, name: "index_reads_on_user_and_readable"
  end
end
