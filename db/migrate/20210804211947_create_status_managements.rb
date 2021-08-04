class CreateStatusManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :status_managements do |t|
      t.integer :performer_id
      t.integer :receiver_id
      t.string :action

      t.timestamps
    end
    add_index :status_managements, :receiver_id
    add_index :status_managements, :performer_id
  end
end
