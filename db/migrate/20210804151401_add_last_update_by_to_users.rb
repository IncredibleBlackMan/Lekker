class AddLastUpdateByToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_updated_by, :integer
  end
end
