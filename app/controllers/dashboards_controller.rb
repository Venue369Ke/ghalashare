class DashboardsController < ApplicationController

before_action :authenticate_user!

def index
  @warehouses = current_user.warehouses
end


end
