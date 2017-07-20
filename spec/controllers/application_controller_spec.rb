require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    before (:each) do
      @request.session[:user_id] = create(:user).id
    end

    describe "current_user" do
      it "finds the current user by the session[:user_id]" do
          user = User.find(@request.session[:user_id])
          expect(@controller.current_user).to eq(user)
      end
    end
end
