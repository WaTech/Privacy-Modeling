class Rule < ApplicationRecord
  enum restriction: %i(allowed limitations forbidden)

  belongs_to :category
  belongs_to :personal_information_item
  belongs_to :use_item
  has_many   :context_items

  delegate :name, to: :category, prefix: true
  delegate :name, to: :personal_information_item, prefix: true
  delegate :name, to: :use_item, prefix: true

  accepts_nested_attributes_for :context_items

end
