# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 
	`ruby-3.1.3`

* System dependencies: 
	postgres

* Database creation and Configuration
	```sh
	sudo -u postgres psql
	CREATE DATABASE vagas_development
	CREATE USER vagas WITH PASSWORD '123456'
	ALTER USER vagas WITH SUPERUSER
	GRANT ALL PRIVILEGES ON DATABASE vagas_development TO vagas_development
	```

* Database initialization
```ruby
	rails db:create
	rails db:migrate
```

* How to run the test suite
