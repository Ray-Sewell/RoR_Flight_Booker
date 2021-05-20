class Passenger < ApplicationRecord
    belongs_to :booking
    validates :name, presence: true, length: {maximum: 40}
    validates :email, presence: true, length: {maximum: 40}
end
