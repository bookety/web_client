class ProfessionalAddress < ApplicationRecord
  belongs_to :address
  belongs_to :professional
end
