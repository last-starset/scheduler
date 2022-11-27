class WorkOrder < ApplicationRecord
    belongs_to :technician
    belongs_to :location
    validates :id, presence: true
    validates :technician_id, presence: true
    validates :location_id, presence: true
    validates :time, presence: true
    validates :duration, presence: true
    validates :price, presence: true

    MINUTES_IN_DAY = 1440

    def self.get_free_times(technician_id)
        
        work_orders = WorkOrder.where("technician_id = ?", technician_id).order("time").to_ary
        free_times_ary = Array.new()
        second_time_in_minutes = work_order_time_to_minutes(work_orders.at(0))
        free_times_ary << [0, second_time_in_minutes, second_time_in_minutes - 0]
        for a in 0...(work_orders.count-1)  do
            first_time_in_minutes = work_order_time_to_minutes(work_orders.at(a)) + work_orders.at(a).duration
            second_time_in_minutes = work_order_time_to_minutes(work_orders.at(a+1))

            free_times_ary << [first_time_in_minutes, second_time_in_minutes, second_time_in_minutes - first_time_in_minutes]
        end
        first_time_in_minutes = work_order_time_to_minutes(work_orders.last) + work_orders.last.duration
        free_times_ary << [first_time_in_minutes, MINUTES_IN_DAY, MINUTES_IN_DAY - first_time_in_minutes]
        list_free_times = Array.new(0)
        found_flag = false
        for a in 0..23 do 
            found_flag = false
            free_times_ary.each do |single| 
                if(single.at(0) <= a * 60 && single.at(1) >= a * 60) 
                    list_free_times << single.at(2)
                    found_flag = true
                    break
                end
            end
            unless found_flag 
                list_free_times << 0
            end
        end
        return list_free_times
    end

    private 

    def self.work_order_time_to_minutes(work_order)
        return work_order.time.to_i.modulo(86400) / 60
    end
end
