class ApplicationController < ActionController::Base
  before_action :authenticate_user!

def not_found
  render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
end
end
