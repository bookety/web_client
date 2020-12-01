class RoomFee < ApplicationRecord
  belongs_to :fee
  belongs_to :room
  belongs_to :available_time
end
