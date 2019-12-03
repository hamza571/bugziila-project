class AddTypesToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :types, :string
  end
end
