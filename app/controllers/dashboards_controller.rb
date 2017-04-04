class DashboardsController < ApplicationController
    def index
        @athletes = User.paginate(:page => params[:page])
        cookies.permanent.signed['users.id'] = current_user.id if user_signed_in?
    end
    
    def search
        @athletes = User.search_by_name(params[:search_name]).paginate(:page => params[:page])
    end
end