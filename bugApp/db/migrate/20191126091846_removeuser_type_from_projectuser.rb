class RemoveuserTypeFromProjectuser < ActiveRecord::Migration[5.2]
  def change
  	remove_column :projectusers, :user_type, :string
  end
end
