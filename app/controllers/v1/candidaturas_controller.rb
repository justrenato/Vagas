class V1::CandidaturasController < ApplicationController

  # GET /candidaturas/ranking
  def ranking
    @candidaturas = Candidatura.where(vaga_id: params[:vaga_id])
    candidatos_ids = @candidaturas.pluck(:pessoa_id)

    @candidatos = Pessoa.where(id: candidatos_ids)
    render json: @candidatos.map{ |candidato| candidato.attributes.merge(candidato.candidaturas.find_by(vaga_id: params[:vaga_id]).score) }.sort_by{|candidato| candidato['score']}.reverse
  end
end
