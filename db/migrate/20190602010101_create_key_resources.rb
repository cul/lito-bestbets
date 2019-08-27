class CreateKeyResources < ActiveRecord::Migration[6.0]
  def change
    create_table :key_resources do |t|
      t.string :title
      t.text :url # Using text rather than string so we don't restrict URL length
      t.string :url_hash # Using url hash to ensure uniqueness
      t.string :description
      t.text :contexts
      t.text :keywords
      t.text :categories
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end

    add_index :key_resources, :title, unique: true
    add_index :key_resources, :url_hash, unique: true
  end
end
