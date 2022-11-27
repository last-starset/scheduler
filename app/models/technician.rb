class Technician < ApplicationRecord
    validates :id, presence: true
    validates :name, presence: true
    has_many :work_orders
end