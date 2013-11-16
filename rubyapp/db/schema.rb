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

ActiveRecord::Schema.define(:version => 20131116041149) do

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

  create_table "estados", :force => true do |t|
    t.string   "descricao"
    t.string   "sigla"
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
