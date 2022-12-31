class Graph 
  def initialize()
    @vertices = {}
  end

  def add_vertex(name, edges)
    @vertices[name] = edges
  end

  def shortest_path(start, finish)
    # cria uma fila de prioridade para armazenar os vértices que ainda precisam ser verificados
    queue = PriorityQueue.new[1] 

    # cria um hash para armazenar as distâncias mínimas de cada vértice até o início
    distances = {}
    # inicialmente, todas as distâncias são infinitas, exceto a distância do início até o próprio início, que é zero
    @vertices.each do |vertex, _|
      distances[vertex] = Float::INFINITY
    end
    distances[start] = 0  

    # adiciona o vértice inicial à fila de prioridade
    queue.push(start => 0)  

    # enquanto a fila não estiver vazia, pegue o vértice com a menor distância e atualize suas distâncias até os outros vértices
    while !queue.empty?
      current_vertex = queue.pop.keys.first
      current_distance = distances[current_vertex]
      @vertices[current_vertex].each do |neighbor, edge_weight|
        # calcule a distância até o vizinho através do vértice atual
        distance = current_distance + edge_weight
        # se a distância através do vértice atual for menor do que a distância atual do vizinho, atualize a distância do vizinho
        if distance < distances[neighbor]
          distances[neighbor] = distance
          # adicione o vizinho à fila de prioridade com a nova distância
          queue.push(neighbor => distance)
        end unless distances[neighbor].nil?
      end
    end  

    # retorne a distância mínima até o vértice final
    distances[finish]
  end
end
