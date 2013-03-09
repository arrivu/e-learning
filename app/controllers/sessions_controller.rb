class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    if is_navigational_format?
      if resource.sign_in_count == 1
        set_flash_message(:notice, :signed_in_first_time)
      else
        set_flash_message(:notice, :signed_in)
      end
    end
    sign_in(resource_name, resource)
    respond_with resource, :location => redirect_location(resource_name, resource)
  end
end