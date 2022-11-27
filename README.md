# README

* Ruby version 3.1.2p20


* Database creation & Initialization

Running the task `rake seed_from_csv` will drop the existing database, migrate the database and seed the database from the csvs, included in the repo. It first runs `db:drop` and `db:migrate` to avoid any issues with already having the data stored.

* Services (job queues, cache servers, search engines, etc.)

Run the server using `ruby bin/rails server` from the root directory for Windows and `bin/rails server` on a *nix system. 
