class Veiculo < ActiveRecord::Base
  belongs_to :cliente
  attr_accessible :ano,:cliente_id, :chassi, :coeficiente, :marca, :modelo, :placa, :pneu, :redutor, :renavam
end
