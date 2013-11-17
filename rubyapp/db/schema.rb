# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131116220136) do

  create_table "cidades", :force => true do |t|
    t.string   "descricao"
    t.integer  "estado_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cidades", ["estado_id"], :name => "index_cidades_on_estado_id"

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "documento"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cep"
    t.integer  "cidade_id"
    t.string   "email"
    t.string   "fone_1"
    t.string   "fone_2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clientes", ["cidade_id"], :name => "index_clientes_on_cidade_id"

  create_table "cronotacografos", :force => true do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "num_serie"
    t.string   "constante_k"
    t.string   "km"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "estados", :force => true do |t|
    t.string   "descricao"
    t.string   "sigla"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ordem_servicos", :force => true do |t|
    t.integer  "cliente_id"
    t.integer  "veiculo_id"
    t.integer  "cronotacografo_id"
    t.date     "data_servico"
    t.integer  "funcionario_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "selo_plastico_colocado"
    t.string   "selo_plastico_retirado"
    t.string   "selo_adesivo_colocado"
    t.string   "selo_adesivo_retirado"
  end

  add_index "ordem_servicos", ["cliente_id"], :name => "index_ordem_servicos_on_cliente_id"
  add_index "ordem_servicos", ["cronotacografo_id"], :name => "index_ordem_servicos_on_cronotacografo_id"
  add_index "ordem_servicos", ["funcionario_id"], :name => "index_ordem_servicos_on_funcionario_id"
  add_index "ordem_servicos", ["veiculo_id"], :name => "index_ordem_servicos_on_veiculo_id"

  create_table "selos", :force => true do |t|
    t.string   "tipo"
    t.string   "numero"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "veiculos", :force => true do |t|
    t.string   "placa"
    t.string   "marca"
    t.string   "modelo"
    t.string   "ano"
    t.string   "pneu"
    t.string   "chassi"
    t.string   "renavam"
    t.string   "coeficiente"
    t.string   "redutor"
    t.integer  "cliente_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "veiculos", ["cliente_id"], :name => "index_veiculos_on_cliente_id"

end
