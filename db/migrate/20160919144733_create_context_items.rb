class CreateContextItems < ActiveRecord::Migration[5.0]
  def change
    create_table :context_items do |t|
      t.belongs_to :rule, foreign_key: true
      t.integer :category
      t.string :description

      t.timestamps
    end
  end
end
