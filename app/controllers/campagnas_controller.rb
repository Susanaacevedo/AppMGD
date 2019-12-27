class CampagnasController < ApplicationController
  before_action :set_campagna, only: [:show, :edit, :update, :destroy]

  # GET /campagnas
  # GET /campagnas.json
  def index
    @campagnas = Campagna.all
  end

  # GET /campagnas/1
  # GET /campagnas/1.json
  def show
  end

  # GET /campagnas/new
  def new
    @campagna = Campagna.new
  end

  # GET /campagnas/1/edit
  def edit
  end

  # POST /campagnas
  # POST /campagnas.json
  def create
    @campagna = Campagna.new(campagna_params)

    respond_to do |format|
      if @campagna.save
        format.html { redirect_to @campagna, notice: 'Campagna was successfully created.' }
        format.json { render :show, status: :created, location: @campagna }
      else
        format.html { render :new }
        format.json { render json: @campagna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campagnas/1
  # PATCH/PUT /campagnas/1.json
  def update
    respond_to do |format|
      if @campagna.update(campagna_params)
        format.html { redirect_to @campagna, notice: 'Campagna was successfully updated.' }
        format.json { render :show, status: :ok, location: @campagna }
      else
        format.html { render :edit }
        format.json { render json: @campagna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campagnas/1
  # DELETE /campagnas/1.json
  def destroy
    @campagna.destroy
    respond_to do |format|
      format.html { redirect_to campagnas_url, notice: 'Campagna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campagna
      @campagna = Campagna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campagna_params
      params.require(:campagna).permit(:nombre, :pagos_id, :meta_id)
    end
end
