class Documento < ApplicationRecord
  validates_size_of :blob, maximum: 1.megabytes, message: "tamanho maximo é 100 mega"
  validate :validar_tipo

  def validar_tipo
    puts @tipo.inspect
    unless ['application/pdf','image/png','image/jpeg','text/plain'].include?(@tipo)
      errors.add(:blob, 'tipo de arquivo não permitido')
    end

  end


  def tipo= value
    @tipo = value
  end

end
