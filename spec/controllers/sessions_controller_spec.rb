require 'spec_helper'

describe SessionsController do

	describe "#create" do
	    it "redirect to orders path after login" do
	    	user = User.create!(name: "user test", email: "test@test.com", password: "passtest123", password_confirmation: "passtest123")
			post :create, locale: 'es', email: user.email, password: user.password
	      	expect(response).to redirect_to(orders_path)
	    end
	end

end
