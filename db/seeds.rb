# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['Health Insurance', 'Licensing', 'Finance'].each do |category_name|
  Category.find_or_create_by! name: category_name
end

['Full Name', 'Social Security Number', 'Ethnicity'].each do |pii_name|
  PersonalInformationItem.find_or_create_by! name: pii_name
end

['Store', 'Print', 'Share'].each do |use_item_name|
  UseItem.find_or_create_by! name: use_item_name
end

# context_item_types = ['Store for a limited time', 'Share with Restriction', 'Do not share publicly']

# %w(limited_store restriction_share forbidden)
# I18n.t :"user_status.#{user.status}"
Category.all.each do |category|
  PersonalInformationItem.all.each do |pii|
    UseItem.all.each do |use_item|

      rule = Rule.find_or_initialize_by category: category, personal_information_item: pii, use_item: use_item, restriction: :allowed

      unless rule.persisted?
        rule.context_items << ContextItem.new(category: :limitation, description: 'Store for a limited time')
        rule.context_items << ContextItem.new(category: :restriction, description: 'Share with Restriction')
        rule.context_items << ContextItem.new(category: :applicable_law, description: 'Do not share publicly')
        rule.save!
      end
    end
  end
end
