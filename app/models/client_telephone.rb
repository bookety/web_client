class ClientTelephone < ApplicationRecord
  belongs_to :client
  belongs_to :telephone
end
