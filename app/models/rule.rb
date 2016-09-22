class Rule < ApplicationRecord
  require 'csv'
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

  def self.to_csv
    headers = [:category_name, :personal_information_item_name, :uses_name, :restriction, :context_item_category, :context_item_description, :context_item_source]
    attribute_names = [:category_name, :personal_information_item_name, :use_item_name, :restriction]

    CSV.generate(headers: true) do |csv|
      csv << headers

      Rule.all.each do |rule|
        if rule.context_items.count > 0
          rule_attributes = attribute_names.map { |attr| rule.public_send attr }
          rule.context_items.each do |context_item|
            csv << rule_attributes + [:category, :description, :source].map { |attr| context_item.public_send attr }
          end
        else
           csv<< attribute_names.map { |attr| rule.public_send attr }
        end
      end
    end
  end
end
