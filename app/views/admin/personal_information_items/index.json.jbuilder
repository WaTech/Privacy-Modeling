json.draw @draw
json.recordsTotal @records_total
json.recordsFiltered @records_total
json.data @personal_information_items, partial: 'personal_information_item', as: :personal_information_item
