class RegisteredApplicationController < ApplicationController
  def create
      @application = RegisteredApplication.new(app_params)
      @application.user = current_user

      if @application.save
        flash[:notice] = "Post was saved"
        redirect_to @application
      else
        flash.now[:alert] = "There was an error saving. Please try again"
        render :new
      end
  end

  def show
    @application = RegisteredApplication.find(params[:id])
  end

  def edit
    @application = RegisteredApplication.find(paramas[:id])
  end

  def new
    @application = RegisteredApplication.new
  end

  def update
    @application = RegisteredApplication.find(params[:id])
    @application.assign_attributes(wiki_params)
    #authorize @application
    if @application.save
      flash[:notice] = "Post was updated."
      redirect_to [@application]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end

  def destroy
  end

  private

  def app_params
    params.require(:wiki).permit(:url, :name, :user_id)
  end
end
