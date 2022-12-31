# frozen_string_literal: true

class Pessoa < ApplicationRecord
  has_many :candidaturas
  validates_presence_of :nome, :profissao, :localizacao, :nivel
  validates_length_of :localizacao, is: 1
  validates_format_of :localizacao, with: /\A[a-zA-Z]\z/, message: 'can only be a single letter'
  LEVELS = {
    1 => 'estagiario',
    2 => 'junior',
    3 => 'pleno',
    4 => 'senior',
    5 => 'especialista'
  }.freeze
end
