class CreateProjectusers < ActiveRecord::Migration[5.2]
  def change
    create_table :projectusers do |t|
      t.string :user_type
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
