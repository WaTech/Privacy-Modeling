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
    rules_size_was = Rule.count
    Category.all.each do |category|
      PersonalInformationItem.all.each do |pii|
        UseItem.all.each do |use_item|
          rule = Rule.find_or_create_by! category: category, personal_information_item: pii, use_item: use_item
        end
      end
    end
    Rule.count - rules_size_was
  end

  def self.to_csv
    headers = [:category_name, :personal_information_item_name, :uses_name, :restriction, :context_item_category, :context_item_description, :context_item_source]
    attribute_names = [:category_name, :personal_information_item_name, :use_item_name, :restriction]

    CSV.generate(headers: true) do |csv|
      csv << headers

      Rule.all.each do |rule|
        rule_attributes = attribute_names.map { |attr| rule.public_send attr }.map { |i| i == 'forbidden' ? 'restricted' : i }

        if rule.context_items.count > 0
          rule.context_items.each do |context_item|
            csv << rule_attributes + [:category, :description, :source].map { |attr| context_item.public_send attr }
          end
        else
           csv << rule_attributes
        end
      end
    end
  end

  def self.import(file)
    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text.encode("UTF-8", "Windows-1252"), headers: true)

    csv.each do |row|
      category = Category.find_or_create_by! name: row['category_name']
      personal_information_item = PersonalInformationItem.find_or_create_by! name: row['personal_information_item_name']
      use_item = UseItem.find_or_create_by! name: row['uses_name']

      rule = Rule.find_or_create_by! category: category, personal_information_item: personal_information_item, use_item: use_item

      restriction = row['restriction']
      restriction = 'forbidden' if restriction == 'restricted'
      rule.update restriction: restriction

      if row['context_item_description'].present?
        context_item = ContextItem.find_or_create_by rule: rule, category: row['context_item_category'], description: row['context_item_description'], source: row['context_item_source']
      end
    end
  end
end
