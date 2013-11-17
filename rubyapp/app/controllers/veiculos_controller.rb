class VeiculosController < ApplicationController
  # GET /veiculos
  # GET /veiculos.json
  def index
    @veiculos = Veiculo.joins(:cliente).select("veiculos.*, clientes.nome").page(params[:page]).per(50).order('nome')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @veiculos }
    end
  end

  # GET /veiculos/1
  # GET /veiculos/1.json
  def show
    @veiculo = Veiculo.joins(:cliente).select("veiculos.*, clientes.nome").where( id: params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @veiculo }
    end
  end

  # GET /veiculos/new
  # GET /veiculos/new.json
  def new
    @veiculo = Veiculo.new
    @clientes = Cliente.select("clientes.*").order("nome")
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @veiculo }
    end
  end

  # GET /veiculos/1/edit
  def edit
    @veiculo = Veiculo.find(params[:id])
    @clientes = Cliente.select("clientes.*").order("nome")
  end

  # POST /veiculos
  # POST /veiculos.json
  def create
    @veiculo = Veiculo.new(params[:veiculo])

    respond_to do |format|
      if @veiculo.save
        format.html { redirect_to @veiculo, notice: 'Veiculo was successfully created.' }
        format.json { render json: @veiculo, status: :created, location: @veiculo }
      else
        format.html { render action: "new" }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /veiculos/1
  # PUT /veiculos/1.json
  def update
    @veiculo = Veiculo.find(params[:id])

    respond_to do |format|
      if @veiculo.update_attributes(params[:veiculo])
        format.html { redirect_to @veiculo, notice: 'Veiculo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculos/1
  # DELETE /veiculos/1.json
  def destroy
    @veiculo = Veiculo.find(params[:id])
    @veiculo.destroy

    respond_to do |format|
      format.html { redirect_to veiculos_url }
      format.json { head :no_content }
    end
  end
  
  # GET /load_veiculos?cliente_id=
  def load_veiculos
    @veiculos = Veiculo.select("veiculos.*").where(cliente_id: params[:cliente_id])
  
    respond_to do |format|
       format.json { render json: @veiculos }
    end
  end
end
