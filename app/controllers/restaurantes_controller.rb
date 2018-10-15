class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: [:show, :edit, :update, :destroy]

  # GET /restaurantes
  # GET /restaurantes.json
  def index
    @restaurantes = Restaurante.all
    if params[:search]
      @restaurantes = Restaurante.search(params[:search]).order("created_at DESC")
    else
      @restaurantes = Restaurante.all.order('created_at DESC')
    end
  end

  def homepage
    @restaurantes = Restaurante.all
    @pratos = Prato.all.where('UPPER(nome) like ?', "%#{params[:nome].to_s.upcase}%") unless params[:nome].blank?
    @pratos = Prato.all.where(category_id: params[:category_id]) unless params[:category_id].blank?
    @restaurantes = Restaurante.includes(:pratos).where('pratos.id' => @pratos.each(&:id)) unless params[:nome].blank?
    @restaurantes = Restaurante.includes(:pratos).where('pratos.id' => @pratos.each(&:id)) unless params[:category_id].blank?
    @categories = Category.all.order :nome
    @wordSearch = params[:nome].to_s unless params[:nome].blank?
  end

  # GET /restaurantes/1
  # GET /restaurantes/1.json
  def show
    @word = Restaurante.find(params[:word].to_s) unless params[:word].blank?
  end

  # GET /restaurantes/new
  def new
    @restaurante = Restaurante.new
  end
  
  # GET /restaurantes/1/edit
  def edit
  end

  # POST /restaurantes
  # POST /restaurantes.json
  def create
    @restaurante = Restaurante.new(restaurante_params)

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to @restaurante, notice: 'Restaurante criado com sucesso!' }
        format.json { render :show, status: :created, location: @restaurante }
      else
        format.html { render :new }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurantes/1
  # PATCH/PUT /restaurantes/1.json
  def update
    respond_to do |format|
      if @restaurante.update(restaurante_params)
        format.html { redirect_to @restaurante, notice: 'Restaurante atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @restaurante }
      else
        format.html { render :edit }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurantes/1
  # DELETE /restaurantes/1.json
  def destroy
    @restaurante.destroy
    respond_to do |format|
      format.html { redirect_to restaurantes_url, notice: 'Restaurante excluido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurante
      @restaurante = Restaurante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurante_params
      params.require(:restaurante).permit(:nome, :telefone, :endereco, {prato_ids: []})
    end
  end
