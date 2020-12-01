class Transaction < ApplicationRecord
  belongs_to :professional_fee
  belongs_to :room_fee
  belongs_to :client
end
