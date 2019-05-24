class ApplicationController < ActionController::Base
  before_action :require_login

  protect_from_forgery with: :exception

  rescue_from Exception, with: :render_500

  def render_500(e)
    ExceptionNotifier.notify_exception(e, :env => request.env, :data => {:message => "error"})
    render template: 'errors/error_500', status: 500
  end

  protected

  def not_authenticated
    redirect_to "/login"
  end

end
