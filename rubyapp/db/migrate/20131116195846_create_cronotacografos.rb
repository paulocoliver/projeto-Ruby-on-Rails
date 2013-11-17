class CreateCronotacografos < ActiveRecord::Migration
  def change
    create_table :cronotacografos do |t|
      t.string :marca
      t.string :modelo
      t.string :num_serie
      t.string :constante_k
      t.string :km

      t.timestamps
    end
  end
end
