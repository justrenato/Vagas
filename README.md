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

* Starting Server in http://localhost:3000/
```ruby
	rails server
```
* Description
	Nesse projeto existem 3 principais models: Vaga, Pessoa e Candidatura. Existe uma quarta model chamada Graph, que serve realizar o cálculo de distâncias dentro do Mapa de localidades fornecido para o teste. Este por sua vez faz o cálculo utilizando o algoritmo Dijkstra.

	Algumas das gems utilizadas:
	  'better_errors',
	  'binding_of_caller', 
	  'httparty'
	  'kaminari'
	  'priority_queue'
	  'pry'
	  'pry-byebug'
	  'rubocop'

* Exemplos de chamada de endpoints
```ruby
	response = HTTParty.post('http://localhost:3000/v1/vagas',
	  body: { vaga: {empresa: 'Teste', titulo: "Vaga teste",
	          descricao: "Criar os mais diferentes tipos de teste",
	          localizacao: "A",
	          nivel: 3} } )

	response = HTTParty.post('http://localhost:3000/v1/pessoas',
	  body: { 'pessoa': {
	    "nome": "John Doe",
	    "profissao": "Engenheiro de Software",
	    "localizacao": "C",
	    "nivel": 2
	} } )

	response = HTTParty.post('http://localhost:3000/v1/candidaturas',
	  body: { 'candidatura': {
	    "vaga_id": 1,
	    "pessoa_id": 2
	} } )
```