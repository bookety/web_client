class ProfessionalFee < ApplicationRecord
  belongs_to :fee
  belongs_to :professional
  belongs_to :available_time
end
