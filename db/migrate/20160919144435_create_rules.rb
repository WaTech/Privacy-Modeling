class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :personal_information_item, foreign_key: true
      t.belongs_to :use_item, foreign_key: true
      t.integer :restriction

      t.timestamps
    end
  end
end
