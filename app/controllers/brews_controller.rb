class BrewsController < ApplicationController
  before_action :set_brew, only: [:show, :edit, :update, :destroy]
  before_action :authorize

 
  def index
    @brews = current_user.brews
  end

  
  def show
  end

  def new
    @brew = Brew.new
  end

  def edit
  end

  def create
    @brew = current_user.brews.new(brew_params)

      if @brew.save
        redirect_to @brew, notice: 'Brew was successfully created.'
      else
        render :new
      end
  end

  def update
    respond_to do |format|
      if @brew.update(brew_params)
        format.html { redirect_to @brew, notice: 'Brew was successfully updated.' }
        format.json { render :show, status: :ok, location: @brew }
      else
        format.html { render :edit }
        format.json { render json: @brew.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brew.destroy
    respond_to do |format|
      format.html { redirect_to brews_url, notice: 'Brew was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_brew
      @brew = Brew.find(params[:id])
    end

    def authorize
      if current_user.nil?
        redirect_to login_url, alert: "Not authorized! Please log in!!"
      else
        if @brew && @brew.user != current_user
          redirect_to root_path, alert: "Not authorized! Only #{@brew.user} has access!!"
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brew_params
      params.require(:brew).permit(:title, :content)
    end
end
