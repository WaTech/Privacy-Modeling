class ContextItem < ApplicationRecord
  enum category: %i(limitation restriction applicable_law)

  belongs_to :rule
end
