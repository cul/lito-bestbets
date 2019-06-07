class ApplicationController < ActionController::Base

  include Devise::Controllers::Helpers
  devise_group :user, contains: [:user]

end
