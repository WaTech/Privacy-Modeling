json.draw @draw
json.recordsTotal @records_total
json.recordsFiltered @records_total
json.data @categories, partial: 'category', as: :category
