json.extract! context_item, :id, :category, :description, :source
json.destroy_url admin_rule_context_item_url(context_item.rule, context_item)

