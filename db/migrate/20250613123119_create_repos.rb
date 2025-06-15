# typed: true

class CreateRepos < ActiveRecord::Migration[8.0]
  def change
    create_table :repos do |t|
      t.string :name
      t.string :slug, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
