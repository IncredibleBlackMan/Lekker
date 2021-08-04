class StatusManagementsController < ApplicationController
  def index
    render jsonapi: StatusManagement.all
  end
end
