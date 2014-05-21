class MedalsController < ApplicationController
  before_action :set_medal, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  # GET /medals
  # GET /medals.json
  def index
    @medals = type_class.all
  end

  # GET /medals/1
  # GET /medals/1.json
  def show
  end

  # GET /medals/new
  def new
    @medal = Medal.new
  end

  # GET /medals/1/edit
  def edit
  end

  # POST /medals
  # POST /medals.json
  def create
    @medal = Medal.new(medal_params)

    respond_to do |format|
      if @medal.save
        format.html { redirect_to @medal, notice: 'Medal was successfully created.' }
        format.json { render :show, status: :created, location: @medal }
      else
        format.html { render :new }
        format.json { render json: @medal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medals/1
  # PATCH/PUT /medals/1.json
  def update
    respond_to do |format|
      if @medal.update(medal_params)
        format.html { redirect_to @medal, notice: 'Medal was successfully updated.' }
        format.json { render :show, status: :ok, location: @medal }
      else
        format.html { render :edit }
        format.json { render json: @medal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medals/1
  # DELETE /medals/1.json
  def destroy
    @medal.destroy
    respond_to do |format|
      format.html { redirect_to medals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medal
      @medal = type_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medal_params
      params.require(:medal).permit(:name, :description, :xp)
    end

    def set_type
       @type = type
    end

    def type 
        params[:type] || "Medal" 
    end

    def type_class 
        type.constantize 
    end
end
