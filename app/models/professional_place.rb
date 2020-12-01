class ProfessionalPlace < ApplicationRecord
  belongs_to :place
  belongs_to :professional
end
