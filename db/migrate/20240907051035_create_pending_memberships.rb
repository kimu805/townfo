class CreatePendingMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :pending_memberships do |t|

      t.timestamps
    end
  end
end
