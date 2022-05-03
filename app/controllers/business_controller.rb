class BusinessController < ApplicationController
    before_action :authorize_business_account!
    
    def show
    end
end
