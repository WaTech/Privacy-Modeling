json.extract! rule, :id, :category_name, :personal_information_item_name, :use_item_name, :restriction
json.url admin_rule_url(rule, format: :json)
json.DT_RowId "row_#{ rule.id }"
json.DT_RowData do
  json.pkey rule.id
end
json.context_items rule.context_items, partial: 'admin/context_items/context_item', as: :context_item

