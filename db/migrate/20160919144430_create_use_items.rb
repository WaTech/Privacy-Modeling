class CreateUseItems < ActiveRecord::Migration[5.0]
  def change
    create_table :use_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
