# frozen_string_literal: true

module V1
  class CandidaturasController < ApplicationController
    before_action :set_candidatura, only: %i[show update destroy]

    # GET /candidaturas
    def index
      @candidaturas = Candidatura.all

      render json: @candidaturas
    end

    # GET /candidaturas/1
    def show
      render json: @candidatura
    end

    # POST /candidaturas
    def create
      @candidatura = Candidatura.new(candidatura_params)

      if @candidatura.save
        render json: @candidatura, status: :created, location: v1_candidatura_url(@candidatura)
      else
        render json: @candidatura.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /candidaturas/1
    def update
      if @candidatura.update(candidatura_params)
        render json: @candidatura
      else
        render json: @candidatura.errors, status: :unprocessable_entity
      end
    end

    # DELETE /vagas/1
    def destroy
      @candidatura.destroy
    end

    # GET /candidaturas/ranking
    def ranking
      @candidaturas = Candidatura.where(vaga_id: params[:vaga_id])
      candidatos_ids = @candidaturas.pluck(:pessoa_id)

      @candidatos = Pessoa.where(id: candidatos_ids)

      @candidatos = @candidatos.map do |candidato|
        candidato.attributes.merge(candidato.candidaturas.find_by(vaga_id: params[:vaga_id]).score)
      end

      render json: @candidatos.sort_by { |candidato| candidato['score'] }.reverse
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_candidatura
      @candidatura = Candidatura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidatura_params
      params.require(:candidatura).permit(:vaga_id, :pessoa_id)
    end
  end
end
