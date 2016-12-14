require 'rails_helper'

RSpec.describe Rule, type: :model do

  describe 'law_kind' do
    it 'existing parameter'do
      should respond_to :law_kind
    end

    let (:law_kind) { ['federal', 'state', 'ordinance'] }
    let (:rule) { Rule.create }

    it 'getting result for federal type' do
      total_law_kind = []

      law_kind.each do |item|
        ContextItem.create applicable_law_kind: item, rule: rule

        total_law_kind << item
        expect(rule.law_kind).to match_array total_law_kind
      end
    end
  end
end
