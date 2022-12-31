class Candidatura < ApplicationRecord
  belongs_to :vaga
  belongs_to :pessoa

  attr_accessor :score

  def n_variable
    candidato = Pessoa.find(self.pessoa_id)
    vaga = Vaga.find(self.vaga_id)
    nv = vaga.nivel
    nc = candidato.nivel
    100 - 25 * (nv - nc).abs
  end

  def load_map
    graph = Graph.new

    graph.add_vertex("A", { "B" => 5 })
    graph.add_vertex("B", { "A" => 5, "D" => 3, "C" => 7 })
    graph.add_vertex("C", { "B" => 7, "E" => 4})
    graph.add_vertex("D", { "B" => 3, "E" => 10, "F" => 8})
    graph.add_vertex("E", { "C" => 4, "D" => 10})
    graph.add_vertex("F", { "D" => 8})

    graph
  end

  def d_variable
    candidato = Pessoa.find(self.pessoa_id)
    vaga = Vaga.find(self.vaga_id)
    graph = load_map
    shortest_distance = graph.shortest_path(candidato.localizacao, vaga.localizacao)
    inf = Float::INFINITY

    case shortest_distance
    when 0..5
      100
    when 5..10
      75  
    when 10..15
      50
    when 15..20
      25
    when 20..inf
      0
    end
  end

  def score_result
    (n_variable + d_variable) / 2
  end

  def score
    {'score' => score_result}
  end
end
