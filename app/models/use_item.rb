class UseItem < ApplicationRecord
  has_many :rules, dependent: :destroy
end
