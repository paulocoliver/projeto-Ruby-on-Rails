class Cliente < ActiveRecord::Base
  belongs_to :cidade
  has_many :veiculos
  
  attr_accessible :bairro,:cidade_id, :cep, :documento, :email, :endereco, :fone_1, :fone_2, :nome
end
