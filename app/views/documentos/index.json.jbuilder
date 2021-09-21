json.array! @documentos do |documento|
   json.id         documento.id
   json.nome       documento.nome
   json.dt_criacao documento.created_at
end