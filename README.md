# README

Este é um projeto desenvolvido para o teste técnico da empresa Vagas.com

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
