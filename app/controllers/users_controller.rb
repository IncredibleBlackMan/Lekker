class UsersController < ApplicationController
  include JSONAPI::Errors

  before_action :find_user_data, except: %i[index]
  after_action :save_status_management, except: %i[index], if: -> { response.status == 200 }

  def index
    render jsonapi: User.filter_by_status(params[:status])
  end

  def archive
    authorize @user_data

    @user_data.archive!

    if @user_data.save
      render jsonapi: @user_data, status: :ok
    else
      render jsonapi_errors: @user_data.errors, status: :unprocessable_entity
    end
  rescue AASM::InvalidTransition => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  def unarchive
    authorize @user_data

    @user_data.unarchive!

    if @user_data.save
      render jsonapi: @user_data, status: :ok
    else
      render jsonapi_errors: @user_data.errors, status: :unprocessable_entity
    end
  rescue AASM::InvalidTransition => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  private

  def save_status_management
    StatusManagement.create_status_management(current_user, @user_data, params[:action])
  end

  def find_user_data
    @user_data = User.find(params[:id])
  end
end
