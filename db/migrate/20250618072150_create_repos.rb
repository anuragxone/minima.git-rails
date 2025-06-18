class CreateRepos < ActiveRecord::Migration[8.0]
  def change
    create_table :repos do |t|
      t.string :name, default: ""
      t.string :slug, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :repos, :slug, unique: true
  end
end
