class AddApplicableLawDescriptionToContextItem < ActiveRecord::Migration[5.0]
  def change
    add_column :context_items, :applicable_law_description, :string
  end
end
