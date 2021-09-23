class DocumentosController < ApplicationController
  resource_description do
    formats ['json']
    error :code => 401, :desc => "a requisição não possui token de acesso valido"
  end
  before_action :set_documento, only: [:show, :update, :destroy]
  # before_action :authenticate_usuario!

  # GET /documentos
  api :GET, '/documentos', 'lista todos os documentos'
  description "lista todos os documentos"
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1
  api :GET, '/documentos/:id'
  param :id, :number, desc: 'id do documento'
  def show
    render json: @documento
  end

  api :GET, '/documento/:id/download', 'realiza o downlod do documento'
  def download
    @documento = Documento.find(params[:documento_id])
    send_data(@documento.blob,:filename => @documento.nome)
  end

  # POST /documentos
  api :POST, '/documento/', 'realiza o upload do documento'
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
  api :PUT, '/documento/:id', 'realiza a alteração do documento'
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


