# README

* Ruby version 3.1.2p20


* Database creation & Initialization

Running the task `rake setup_all` will both migrate the database and seed the database from the csvs, included in the repo. It first runs `db:migrate` and then proceeds to run the task `seed_from_csv`.

* Services (job queues, cache servers, search engines, etc.)

Run the server using `ruby bin/rails server` from the root directory for Windows and `bin/rails server` on a *nix system. 
