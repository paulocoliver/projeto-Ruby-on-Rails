class Estado < ActiveRecord::Base
  attr_accessible :descricao, :sigla
  has_many :cidades
end
