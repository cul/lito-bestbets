class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  devise_group :user, contains: [:user]

  before_action :require_allowed_user!

  def require_allowed_user!
    # reject unallowed user
    if current_user.present?
      if !current_user_is_allowed_to_log_in?
        user_uid = current_user.uid
        sign_out
        redirect_to(root_path, flash: { error: "User #{user_uid} does not have permission to log into this app." })
      end
      return
    end

    return if params[:controller] == 'key_resources' && params[:action] == 'index'
    return if params[:controller] == 'sessions'# && params[:action] == 'developer_new'
    authenticate_user!
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    cas_opts = YAML.load_file(File.join(Rails.root, 'config', 'cas.yml'))[Rails.env] || {}

    # In non-deployed environments, or if CAS options are absent, we should only
    # do application-level logout, not CAS logout. Warn, and proceed.
    if request.host == 'localhost' || cas_opts['host'].blank? || cas_opts['logout_url'].blank?
      Rails.logger.error 'CAS options missing - skipping CAS logout!'
      return root_path
    end

    # Full CAS logout + application logout page looks like this:
    # https://cas.columbia.edu/cas/logout?service=https://helpdesk.cul.columbia.edu/welcome/logout
    cas_logout_url = 'https://' + cas_opts['host'] + cas_opts['logout_url']
    service = request.base_url + root_path
    after_sign_out_path = "#{cas_logout_url}?service=#{service}"
    Rails.logger.debug "after_sign_out_path = #{after_sign_out_path}"
    after_sign_out_path
  end

  private

  def current_user_is_allowed_to_log_in?
    return true if Rails.env.development? && current_user.uid == DEVELOPMENT_USER_CONFIG[:uid]
    return true if ALLOWED_USER_IDS.include?(current_user.uid)
    return true if (ALLOWED_USER_AFFILS & current_user.affils).present?
    return false
  end
end
