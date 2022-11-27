class Location < ApplicationRecord
    validates :id, presence: true
    validates :name, presence: true
    validates :city, presence: true
    has_many :work_orders
end
