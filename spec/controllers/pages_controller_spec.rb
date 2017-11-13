require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:approved_article) { FactoryBot.create(:article, status: :approved) }
  let(:pending_article) { FactoryBot.create(:article) }
  let(:item) { FactoryBot.create(:item) }
  let(:category) { FactoryBot.create(:category) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #crew" do
    it "returns http success" do
      get :crew
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #shop" do
    it "returns http success" do
      get :shop
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #activities" do
    it "returns http success" do
      get :activities
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: approved_article.id }
      expect(response).to have_http_status(:success)
    end

    describe "when article is still in pending status, it" do
      it "will returns redirect http code" do
        get :show, params: { id: pending_article.id }
        expect(response).to have_http_status(:redirect)
      end
      it "will redirect to root url" do
        get :show, params: { id: pending_article.id }
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe "GET #category will" do
    it "returns http success" do
      get :category, params: { sort: category.slug }
      expect(response).to have_http_status(:success)
    end
    it "render the category template" do
      get :category, params: { sort: category.slug }
      expect(response).to render_template(:category)
    end
  end

  describe "GET #shop_show" do
    it "will returns http success" do
      get :shop_show, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end

    describe "when item is not found, it" do
      it "will returns redirect http code" do
        get :show, params: { id: item.id }
        expect(response).to have_http_status(:redirect)
      end
      it " will redirect to root url" do
        get :show, params: { id: item.id }
        expect(response).to redirect_to(root_url)
      end
    end
  end

end
