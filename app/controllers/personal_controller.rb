class PersonalController < ApplicationController
    before_action :authorize_individual_account!
    def show
    end
end
