require 'rails_helper'
require 'faker'

RSpec.describe RegisteredApplicationsController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryBot.create(:user)
      sign_in @my_user
      @my_app = FactoryBot.create(:registered_application, user: @my_user)
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "renders the index view" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
      it "instantiates @wiki" do
        get :new
        expect(assigns(:applet)).not_to be_nil
        #applet is refering to the class variable: @applet in the controller.
      end
    end

    describe "POST create" do
      it "increases the number of Registered Applications by 1" do
        expect{post :create, params: { :registered_application => { name: "bloccit", url: "demo-bloccit.herokuapp.com", user: @my_user}}}.to change(RegisteredApplication,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
      post :create, params: { :registered_application => { name: "bloccit", url: "demo-bloccit.herokuapp.com", user: @my_user}}
      expect(assigns(:applet)).to eq RegisteredApplication.last
      end

      it "redirects to the new wiki" do
        post :create, params: { :registered_application => { name: "bloccit", url: "demo-bloccit.herokuapp.com", user: @my_user}}
        expect(response).to redirect_to RegisteredApplication.last
      end
    end

    describe "GET edit" do
      it "returns http redirect and renders" do
        get :edit, params: { id: @my_app.id }
        expect(response).to have_http_status(:success)
        #got lazy and combined them
        expect(response).to render_template :edit
      end

      it "assigns registered application to be updated to @applet" do
        get :edit, params: { id: @my_app.id }
        app_instance = assigns(:applet)

        expect(app_instance.id).to eq @my_app.id
        expect(app_instance.name).to eq @my_app.name
        expect(app_instance.url).to eq @my_app.url
      end
    end

    describe "PUT update" do
      it "updates applet with expected attributes" do
        new_name = Faker::Hacker.noun
        new_url = Faker::Hacker.verb + ".com"

        put :update, params: {id: @my_app.id, registered_application: {name: new_name,  url: new_url}}

        updated_applet = assigns(:applet)
        expect(updated_applet.id).to eq @my_app.id
        expect(updated_applet.name).to eq new_name
        expect(updated_applet.url).to eq new_url
      end
    end

    describe "GET show" do
      it "shows the wiki" do
        get :show, params: {id: @my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: { id: @my_app.id}
        expect(response).to render_template :show
      end

      it "assigns @my_app to :applet" do
        get :show, params: {id: @my_app.id}
        expect(assigns(:applet)).to eq(@my_app)
      end
    end

    describe "Delete destroy" do
      it "deletes the wiki" do
        delete :destroy, params: {id: @my_app.id}
        count = RegisteredApplication.where({ id: @my_app.id}).size
        expect(count).to eq 0
      end

      it "redirects to the account page" do
        delete :destroy, params: {id: @my_app.id}
        expect(response).to redirect_to registered_applications_path
      end
    end
  end
end
