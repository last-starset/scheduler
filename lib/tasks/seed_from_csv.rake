require 'csv'
task :seed_from_csv => [ :environment ] do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:migrate'].invoke 
    CSV.foreach(Rails.root.join('lib/seeds/locations.csv'), headers: true) do |row|
        Location.create({
            id: row[0],
            name: row[1],
            city: row[2]
        })
    end


    CSV.foreach(Rails.root.join('lib/seeds/technicians.csv'), headers: true) do |row|
        Technician.create({
            id: row[0],
            name: row[1]
        })
    end

    CSV.foreach(Rails.root.join('lib/seeds/work_orders.csv'), headers: true) do |row|
        WorkOrder.create({
            id: row[0],
            technician_id: row[1],
            location_id: row[2],
            time: Time.strptime(row[3], "%m/%d/%y %H:%M"),
            duration: row[4],
            price: row[5]
        })
    end
end