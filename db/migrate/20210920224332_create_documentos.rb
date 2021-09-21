class CreateDocumentos < ActiveRecord::Migration[6.1]
  def change
    create_table :documentos do |t|
      t.string :nome
      t.binary :blob

      t.timestamps
    end
  end
end
