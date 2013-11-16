class Veiculo < ActiveRecord::Base
  has_one :cliente
  attr_accessible :ano,:cliente_id, :chassi, :coeficiente, :marca, :modelo, :placa, :pneu, :redutor, :renavam
end
