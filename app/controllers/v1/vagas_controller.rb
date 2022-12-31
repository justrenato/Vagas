class V1::VagasController < ApplicationController
  before_action :set_vaga, only: %i[ show update destroy ]

  # GET /vagas
  def index
    @vagas = Vaga.all

    render json: @vagas
  end

  # GET /vagas/1
  def show
    render json: @vaga
  end

  # POST /vagas
  def create
    @vaga = Vaga.new(vaga_params)

    if @vaga.save
      render json: @vaga, status: :created, location: @vaga
    else
      render json: @vaga.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vagas/1
  def update
    if @vaga.update(vaga_params)
      render json: @vaga
    else
      render json: @vaga.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vagas/1
  def destroy
    @vaga.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaga
      @vaga = Vaga.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vaga_params
      params.fetch(:vaga, {})
    end
end
