class Category < ApplicationRecord
  has_many :rules, dependent: :destroy
end
