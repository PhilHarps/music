class AddSchoolToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_school, :boolean, default: false
  end
end
