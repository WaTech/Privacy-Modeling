class PersonalInformationItem < ApplicationRecord
  has_many :rules, dependent: :destroy
end
