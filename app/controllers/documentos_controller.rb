class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :update, :destroy]

  # GET /documentos
  def index
    @documentos = Documento.all

    render json: @documentos
  end

  # GET /documentos/1
  def show
    render json: @documento
  end

  # POST /documentos
  def create
    @documento = Documento.new(:nome => params[:nome], :blob => params[:blob].read)
    # @documento = Documento.new(documento_params)

    if @documento.save
      render json: @documento, status: :created, location: @documento
    else
      render json: @documento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documentos/1
  def update
    if @documento.update(documento_params)
      render json: @documento
    else
      render json: @documento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /documentos/1
  def destroy
    @documento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documento_params
      params.require(:documento).permit(:nome, :blob)
    end
end


