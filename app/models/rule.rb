# frozen_string_literal: true

# Stores information about rules, such as which profiles can it be
# found in, what hosts are associated with it, etceter
class Rule < ApplicationRecord
  validates :ref_id, uniqueness: true, presence: true

  def from_oscap_object(oscap_rule)
    self.ref_id = oscap_rule.id
    self.title = oscap_rule.title
    self.rationale = oscap_rule.rationale
    self.description = oscap_rule.description
    self.severity = oscap_rule.severity
    self
  end
end
