class ApplicationController < ActionController::Base
  # After login
  def after_sign_in_path_for(resource)
    restaurants_path  # or your desired home page
  end

  # After logout (optional)
  def after_sign_out_path_for(resource_or_scope)
    root_path  # or login page or any other page
  end
end
