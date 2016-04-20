class TacticsController < ApplicationController
  before_action :set_tactic, only: [:show, :edit, :update, :destroy]
  ActionController::Parameters.permit_all_parameters = true

  # GET /tactics
  # GET /tactics.json
  def index
    @tactics = Tactic.all
  end

  # GET /tactics/1
  # GET /tactics/1.json
  def show
  end

  # GET /tactics/new
  def new
    @tactic = Tactic.new
    @channels = Channel.all
    render :partial => 'edit_in_popover', :layout => false
  end

  # GET /tactics/1/edit
  def edit
  end

  # POST /tactics
  # POST /tactics.json
  def create
    @tactic = Tactic.new(tactic_params)
    puts tactic_params.inspect
    @tactic.event = current_user.department.team.events.first
    @tactic.starts_on = tactic_params.starts_on
    @tactic.ends_on = tactic_params.ends_on

    puts tactic_params.inspect
    puts @tactic.inspect

    respond_to do |format|
      if @tactic.save
        format.html { redirect_to @tactic, notice: 'Tactic was successfully created.' }
        format.json { render :show, status: :created, location: @tactic }
      else
        puts @tactic.errors.full_messages
        format.html { render :new }
        format.json { render json: @tactic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tactics/1
  # PATCH/PUT /tactics/1.json
  def update
    respond_to do |format|
      if @tactic.update(tactic_params)
        format.html { redirect_to @tactic, notice: 'Tactic was successfully updated.' }
        format.json { render :show, status: :ok, location: @tactic }
      else
        format.html { render :edit }
        format.json { render json: @tactic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tactics/1
  # DELETE /tactics/1.json
  def destroy
    @tactic.destroy
    respond_to do |format|
      format.html { redirect_to tactics_url, notice: 'Tactic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tactic
      @tactic = Tactic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tactic_params
      params.fetch(:tactic, {})
    end

    def tactic_params
      params.require(:tactic).permit(:title, :channel_id, :starts_on, :ends_on)
    end

end
