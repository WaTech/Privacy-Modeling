class ContextItem < ApplicationRecord
  enum category: %i(limitation restriction applicable_law)
  enum applicable_law_kind: %i(federal state ordinance)

  belongs_to :rule
end
