class RegisteredApplicationsController < ApplicationController
  def index
    #make it so only users can see their own applications.
    @applets = RegisteredApplication.all.select{|x| x.user_id == current_user.id}
  end

  def new
    @applet = RegisteredApplication.new
  end

  def create
    @applet = RegisteredApplication.new(app_params)
    @applet.user = current_user

    if @applet.save
      flash[:notice] = "Post was saved"
      redirect_to @applet
    else
      flash.now[:alert] = "There was an error saving. Please try again"
      render :new
    end
  end

  def show
    @applet = RegisteredApplication.find(params[:id])
    @events = @applet.events.group_by(&:name)
  end

  def edit
    @applet = RegisteredApplication.find(params[:id])
  end

  def update
    @applet = RegisteredApplication.find(params[:id])
    @applet.assign_attributes(app_params)
    #authorize @applet
    if @applet.save
      flash[:notice] = "Post was updated."
      redirect_to [@applet]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end

  def destroy
    @applet = RegisteredApplication.find(params[:id])
    #authorize@wiki_page
    if @applet.destroy
      flash[:notice] = "\"#{@applet.name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  def get_views
    @applet = RegisteredApplication.find(params[:id])
    render json: @applet.events.group_by_day(:created_at).count
  end

  private

  def app_params
    params.require(:registered_application).permit(:url, :name, :user_id)
    #.require method ensures that a specific parameter is present, and if it's not provided, the require method throws and error. It returns an instance of ActionController::Parameter for the key passed into require
  end
end
