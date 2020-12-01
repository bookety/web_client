class ProfessionalDocument < ApplicationRecord
  belongs_to :document
  belongs_to :professional
end
