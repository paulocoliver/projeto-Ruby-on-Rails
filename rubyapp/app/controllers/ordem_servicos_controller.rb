class OrdemServicosController < ApplicationController
  # GET /ordem_servicos
  # GET /ordem_servicos.json
  def index
    @ordem_servicos = OrdemServico.joins(
                                      :cliente, 
                                      :veiculo, 
                                      :cronotacografo,
                                      :funcionario
                                  ).select(
                                      "ordem_servicos.*, 
                                      clientes.nome nome_cliente,
                                      veiculos.marca,
                                      cronotacografos.num_serie,
                                      funcionarios.nome nome_funcionario
                                  ")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ordem_servicos }
    end
  end

  # GET /ordem_servicos/1
  # GET /ordem_servicos/1.json
  def show
    @ordem_servico = OrdemServico.joins(
                                      :cliente, 
                                      :veiculo, 
                                      :cronotacografo,
                                      :funcionario
                                  ).select(
                                      "ordem_servicos.*, 
                                      
                                      clientes.nome cliente_nome,
                                      clientes.documento cliente_documento,
                                      clientes.endereco cliente_endereco,
                                      clientes.bairro cliente_bairro,
                                      clientes.cep cliente_cep,
                                      (select c.descricao from cidades c where c.id = clientes.cidade_id) as cliente_cidade,
                                      (select e.sigla from estados e where e.id = (select estado_id from cidades where cidades.id = clientes.cidade_id) ) as cliente_uf,
                                      clientes.fone_1 cliente_fone,
                                      clientes.email cliente_email,
                                      
                                      veiculos.placa veiculo_placa,
                                      veiculos.marca veiculo_marca,
                                      veiculos.modelo veiculo_modelo,
                                      veiculos.ano veiculo_ano,
                                      veiculos.chassi veiculo_chassi,
                                      veiculos.renavam veiculo_renavam,
                                      veiculos.coeficiente veiculo_coeficiente,
                                      veiculos.redutor veiculo_redutor,
                                      
                                      cronotacografos.marca cronotacografo_marca,
                                      cronotacografos.modelo cronotacografo_modelo,
                                      cronotacografos.num_serie cronotacografo_num_serie,
                                      cronotacografos.constante_k cronotacografo_constante_k,
                                      cronotacografos.km cronotacografo_km,
                                      
                                      funcionarios.nome funcionario_nome
                                  ").where(
                                    id: params[:id]
                                  ).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ordem_servico }
    end
  end

  # GET /ordem_servicos/new
  # GET /ordem_servicos/new.json
  def new
    @ordem_servico = OrdemServico.new
    
    @selo_plastico = Selo.select("selos.*").where(tipo: "Plastico")
    @selo_adesivo  = Selo.select("selos.*").where(tipo: 'Adesivo')
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ordem_servico }
    end
  end

  # GET /ordem_servicos/1/edit
  def edit
    @ordem_servico = OrdemServico.find(params[:id])
    @selo_plastico = Selo.select("selos.*").where(tipo: "Plastico")
    @selo_adesivo  = Selo.select("selos.*").where(tipo: 'Adesivo')
    @veiculos      = Veiculo.select("veiculos.*").where(cliente_id: @ordem_servico.cliente_id )
  end

  # POST /ordem_servicos
  # POST /ordem_servicos.json
  def create
    @ordem_servico = OrdemServico.new(params[:ordem_servico])

    respond_to do |format|
      if @ordem_servico.save
        format.html { redirect_to @ordem_servico, notice: 'Ordem servico was successfully created.' }
        format.json { render json: @ordem_servico, status: :created, location: @ordem_servico }
      else
        format.html { render action: "new" }
        format.json { render json: @ordem_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ordem_servicos/1
  # PUT /ordem_servicos/1.json
  def update
    @ordem_servico = OrdemServico.find(params[:id])

    respond_to do |format|
      if @ordem_servico.update_attributes(params[:ordem_servico])
        format.html { redirect_to @ordem_servico, notice: 'Ordem servico was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ordem_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordem_servicos/1
  # DELETE /ordem_servicos/1.json
  def destroy
    @ordem_servico = OrdemServico.find(params[:id])
    @ordem_servico.destroy

    respond_to do |format|
      format.html { redirect_to ordem_servicos_url }
      format.json { head :no_content }
    end
  end
end
