class Cidade < ActiveRecord::Base
  belongs_to :estado
  attr_accessible :descricao, :estado_id
end
