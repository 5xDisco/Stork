class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, :with => :render_404

  private
  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def record_not_found
    render file: "public/404.html", status: :not_found
  end

  def render_404(exception = nil)
    if exception
        logger.info "Rendering 404: #{exception.message}"
    end

    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
