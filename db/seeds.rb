seed_data = YAML.load_file(Rails.root.join('lib', 'seed.yml'))['v2']

seed_data['categories'].each do |category_name|
  Category.find_or_create_by! name: category_name
end

seed_data['pi_items'].each do |pii_name|
  PersonalInformationItem.find_or_create_by! name: pii_name
end

seed_data['uses'].each do |use_item_name|
  UseItem.find_or_create_by! name: use_item_name
end

Category.all.each do |category|
  PersonalInformationItem.all.each do |pii|
    UseItem.all.each do |use_item|
      rule = Rule.find_or_create_by! category: category, personal_information_item: pii, use_item: use_item, restriction: :allowed
    end
  end
end

unless Rails.env.production?
  user = User.find_or_initialize_by email: 'yuriy@testnest.co'
  user.update!(password: 'vK0v2Xpv6KCEU9tG9f78')

  yuriy = User.find_or_initialize_by email: 'yuri.kurat@n3wnormal.com'
  yuriy.update!(password: 'Q$Kg5BH*9j91Xm1OoXxxzw07')
end
