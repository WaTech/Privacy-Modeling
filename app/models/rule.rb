class Rule < ApplicationRecord
  enum restriction: %i(allowed limitations forbidden)

  belongs_to :category
  belongs_to :personal_information_item
  belongs_to :use_item
  has_many   :context_items, dependent: :destroy

  delegate :name, to: :category, prefix: true
  delegate :name, to: :personal_information_item, prefix: true
  delegate :name, to: :use_item, prefix: true

  accepts_nested_attributes_for :context_items

  def self.generate!
    Category.all.each do |category|
      PersonalInformationItem.all.each do |pii|
        UseItem.all.each do |use_item|
          rule = Rule.find_or_create_by! category: category, personal_information_item: pii, use_item: use_item
        end
      end
    end
  end
end
