class Rule < ApplicationRecord
  enum status: %i(allowed limitations forbidden)

  belongs_to :category
  belongs_to :personal_information_item
  belongs_to :use_item
  has_many   :context_items
end
