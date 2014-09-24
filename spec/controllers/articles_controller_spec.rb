require 'rails_helper'
require 'spec_helper'

describe ArticlesController, type: :controller do
  before(:each) do
    #this use for create new user
    @user = FactoryGirl.create(:user)
    #this use for activation account
    @user.update(:activation_token=>"", :activation_status => "active")
    #this for login
    session[:user] = @user.id
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns @articles" do
      @article = FactoryGirl.create(:article)
      get :index
      expect(response).to render_template :index
    end

    it "must render template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    it "successfully create new article" do
      post :create, article: FactoryGirl.attributes_for(:article)
      expect(response).to redirect_to action: :index
    end

    it "fails create new article" do
      post :create, article: FactoryGirl.attributes_for(:invalid_article)
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    before :each do
      @article = FactoryGirl.create(:article)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @article
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should redirect to show page" do
      get :show, id: @article
      expect(response).to render_template :show
    end
  end

  describe "PUT #update" do
    before :each do
      @article = FactoryGirl.create(:article)
    end

    context "valid attributes" do
      it "shoud success update" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article, title: "update title article from rspec")
        @article.reload
        expect(@article.title).to eq("update title article from rspec")
        expect(response).to redirect_to action: "index"
      end

      it "shoud fails update" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article, title: "")
        @article.reload
        expect(response).to render_template "edit"
      end
    end
  end

  describe "DELETE #delete" do
    before :each do
      @article = FactoryGirl.create(:article)
    end
    it "should success delete" do
      delete :destroy, id: @article
      expect(response).to redirect_to action: :index
    end
  end

end
