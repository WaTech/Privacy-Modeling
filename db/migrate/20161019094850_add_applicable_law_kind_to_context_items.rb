class AddApplicableLawKindToContextItems < ActiveRecord::Migration[5.0]
  def change
    add_column :context_items, :applicable_law_kind, :integer
  end
end
