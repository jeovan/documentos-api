class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :update, :destroy]
  # before_action :authenticate_usuario!

  # GET /documentos
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1
  def show
    render json: @documento
  end

  def download
    @documento = Documento.find(params[:documento_id])
    send_data(@documento.blob,:filename => @documento.nome)
  end

  # POST /documentos
  def create

    @documento = Documento.new(
      :nome => params[:blob].original_filename,
      :blob => params[:blob].read,
      :tipo => params[:blob].content_type
    )


    if @documento.save
      render :show, status: :created, location: @documento
    else
      render json: @documento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documentos/1
  def update
    if @documento.update(documento_params)
      render :show
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
      params.permit(:nome, :blob)
    end
end


