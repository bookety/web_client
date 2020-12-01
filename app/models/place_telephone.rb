class PlaceTelephone < ApplicationRecord
  belongs_to :place
  belongs_to :telephone
end
