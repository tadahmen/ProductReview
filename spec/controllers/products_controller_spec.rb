require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe ProductsController, type: :controller do
  # a_product = FactoryGirl.create(:product)
  let!(:valid_attributes) {{
    "name" => "ProductName for test",
    "description" => "ProductDescription for test",
    "shop" => "ProductShop for test"
                            }}
  let!(:a_product) { Product.create! valid_attributes }

  FactoryGirl.create_list(:product, 10)

  describe "GET #index" do
    it "renders a JSON with all products" do
      get :index
      expect(json['products'].length).to eq(10)
      #  expect(assigns(:posts)).to eq([a_post])   #hoe schrijf je  hier een goede expect voor??
    end
  end
end
