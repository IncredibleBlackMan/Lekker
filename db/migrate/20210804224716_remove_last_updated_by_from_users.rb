class RemoveLastUpdatedByFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :last_updated_by, :integer
  end
end
