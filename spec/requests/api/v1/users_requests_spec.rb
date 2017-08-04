require 'rails_helper'

RSpec.describe "API::V1::UsersController", type: :request do

  describe "POST /users" do

    describe "on success" do

      before(:each) do
        params = {
          user: {
            first_name: "Cernan",
            last_name: "Bernardo",
            email: "cernan@flatironschool.com",
            password: "password"
          }
        }

        post "/api/v1/users",
          params: params.to_json,
          headers: {'Content-Type': 'application/json'}
        
        @response = response
      end

      it "creates a user from the params" do
        expect(User.all.count).to eq(1)  
      end

      it "returns the new user and a JWT token" do
        body = JSON.parse(@response.body)

        expect(response.status).to eq(200)
        expect(body["user"]["id"]).not_to eq(nil)
        expect(body["user"]["email"]).to eq("cernan@flatironschool.com")
        expect(body["user"]["password_digest"]).to eq(nil)
        expect(body['token']).not_to eq(nil)
      end 
    end

    describe "on error" do

      before(:each) do
        User.create(
          email: "cernan@flatironschool.com",
          password: "password"                    
        )
      end

      xit "unable to find user with email" do
        params = {
          user: {
            email: "cernan@thepub.com",
            password: "password"
          }
        }

        post "/api/v1/auth",
          params: params.to_json,
          headers: {'Content-Type': 'application/json'}
        
        body = JSON.parse(response.body)

        expect(response.status).to eq(500)
        expect(body["errors"]).to include()
        binding.pry
      end
    end
  end

end
