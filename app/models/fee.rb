class Fee < ApplicationRecord
    validates :fee_value_in_cents, presence: true
end
