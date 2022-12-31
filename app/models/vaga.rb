# frozen_string_literal: true

class Vaga < ApplicationRecord
  validates_presence_of :empresa, :titulo, :descricao, :localizacao, :nivel
end
