# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  def new
    self.resource = resource_class.new
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      flash[:alert] = resource.errors.full_messages.join(' - ')
      redirect_to new_reset_password_path(email: resource.email)
    end
  end
end
