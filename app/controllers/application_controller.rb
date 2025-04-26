class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.is_a?(JobSeeker)
      jobseeker_index_path(resource)
    elsif resource.is_a?(Employer)
      jobs_path(resource)
    else
      root_path
    end
  end
end
