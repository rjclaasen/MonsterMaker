class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  # GET /monsters
  # GET /monsters.json
  def index
    @monsters = Monster.all
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
  end

  # GET /monsters/new
  def new
    @monster = Monster.new
  end

  # GET /monsters/1/edit
  def edit
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      flash[:success] = "Monster created!"
      redirect_to monster_path(@monster)
    else
      @feed_items = []
      render 'new'
    end
  end

  # PATCH/PUT /monsters/1
  # PATCH/PUT /monsters/1.json
  def update
    respond_to do |format|
      if @monster.update(monster_params)
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster }
      else
        format.html { render :edit }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster.destroy
    flash[:success] = "Monster deleted"
    redirect_to request.referrer || monsters_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster
      @monster = Monster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_params
      params.require(:monster).tap { |whitelisted| 
        whitelisted[:properties_attributes] = params[:properties] if params.has_key?(:prices) 
      }.except(:properties)
        .permit(:id, :name, :sizeTypeAlignment, :armorClass, 
        :hitPointsAndDice, :speed, :strength, :dexterity, :constitution, 
        :intelligence, :wisdom, :charisma, :skills, :damageImmunities, 
        :conditionImmunities, :senses, :languages, :challenge,
        properties_attributes: [:id, :name, :description, :_destroy])
    end
end
