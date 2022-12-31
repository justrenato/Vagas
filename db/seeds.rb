# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Pessoa.create([
	{nome: 'Renato Ribeiro', profissao: 'Software Engineer ROR', localizacao: 'A', nivel: 3},
	{nome: 'Clodoaldo de oliveira', profissao: 'Software Engineer ROR', localizacao: 'F', nivel: 2}
	])
Vaga.create({empresa: 'Vagas for Business', titulo: 'Dev Ruby on Rails Pleno/Senior', descricao: 'Vaga para desenvolvedore de Ruby on Rails', localizacao: 'C', nivel: 3})
Candidatura.create(pessoa: Pessoa.first, vaga: Vaga.first)
Candidatura.create(pessoa: Pessoa.last, vaga: Vaga.first)
