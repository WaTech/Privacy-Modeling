class AddSourceToContextItems < ActiveRecord::Migration[5.0]
  def change
    add_column :context_items, :source, :string
  end
end
