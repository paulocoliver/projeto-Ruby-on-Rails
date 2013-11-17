class CronotacografosController < ApplicationController
  # GET /cronotacografos
  # GET /cronotacografos.json
  def index
    @cronotacografos = Cronotacografo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cronotacografos }
    end
  end

  # GET /cronotacografos/1
  # GET /cronotacografos/1.json
  def show
    @cronotacografo = Cronotacografo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cronotacografo }
    end
  end

  # GET /cronotacografos/new
  # GET /cronotacografos/new.json
  def new
    @cronotacografo = Cronotacografo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cronotacografo }
    end
  end

  # GET /cronotacografos/1/edit
  def edit
    @cronotacografo = Cronotacografo.find(params[:id])
  end

  # POST /cronotacografos
  # POST /cronotacografos.json
  def create
    @cronotacografo = Cronotacografo.new(params[:cronotacografo])

    respond_to do |format|
      if @cronotacografo.save
        format.html { redirect_to @cronotacografo, notice: 'Cronotacografo was successfully created.' }
        format.json { render json: @cronotacografo, status: :created, location: @cronotacografo }
      else
        format.html { render action: "new" }
        format.json { render json: @cronotacografo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cronotacografos/1
  # PUT /cronotacografos/1.json
  def update
    @cronotacografo = Cronotacografo.find(params[:id])

    respond_to do |format|
      if @cronotacografo.update_attributes(params[:cronotacografo])
        format.html { redirect_to @cronotacografo, notice: 'Cronotacografo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cronotacografo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cronotacografos/1
  # DELETE /cronotacografos/1.json
  def destroy
    @cronotacografo = Cronotacografo.find(params[:id])
    @cronotacografo.destroy

    respond_to do |format|
      format.html { redirect_to cronotacografos_url }
      format.json { head :no_content }
    end
  end
end
