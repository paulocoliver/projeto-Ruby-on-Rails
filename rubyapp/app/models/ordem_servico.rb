class OrdemServico < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :veiculo
  belongs_to :cronotacografo
  belongs_to :funcionario
  attr_accessible :cliente_id, :veiculo_id, :cronotacografo_id, :funcionario_id, :data_servico, :selo_plastico_colocado, :selo_plastico_retirado, :selo_adesivo_colocado, :selo_adesivo_retirado
end
