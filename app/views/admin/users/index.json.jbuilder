json.draw @draw
json.recordsTotal @records_total
json.recordsFiltered @records_total
json.data @users, partial: 'user', as: :user
