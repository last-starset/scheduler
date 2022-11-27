class WorkOrdersController < ApplicationController
  def show
    @work_order = WorkOrder.find(params[:id])
  end
  def index 
    @work_orders = WorkOrder.all
    @locations = Location.all
    @technicians = Technician.all
    @free_time_array = Array.new 
    for a in 1..@technicians.count do 
      @free_time_array.insert(a, WorkOrder.get_free_times(a))
    end
  end
end
