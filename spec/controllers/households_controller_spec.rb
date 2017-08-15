require 'rails_helper'

RSpec.describe Api::V1::HouseholdsController, type: :controller do

  before(:each) do
    @user = create(:user)
    @request.session[:user_id] = @user.id
  end

  describe 'GET index' do

    xit "returns all households that belong to the user" do
      household1 = create(:household, user: @user)
      user2 = User.create(first_name: "Ashley",
                          last_name: "Bernardo",
                          email: "ashley@gmail.com",
                          password: "password")
      household2 = Household.create(name: "Johnson Family",
                                    address: "123 Main St",
                                    monthly_rate: 3000,
                                    user: user2)
      
      
      # params = {
      #   email: @user.email,
      #   password: "password"                
      # }                              
      post "api/v1/auth"                             
      get :index

      expect(assigns[:households]).to include(household1)
    end
  end

end
