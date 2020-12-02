class Room < ApplicationRecord
    belongs_to :place
    has_many :room_fees
    has_many :available_times, through: :room_fees

    validates :room_name, presence: true
end
