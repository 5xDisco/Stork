class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  # Overwriting the sign_out redirect path method

  def record_not_found
    render file: "public/404.html", status: :not_found
  end
end
