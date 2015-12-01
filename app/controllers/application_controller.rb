class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :link_for

  private

  def link_for(path, locale=:es)
    case locale
      when :es
        return '/' if path == '/en'
        (path.include? '/en') ? path.gsub('/en', '') : path
      when :en
        (path.include? '/en') ? path : '/en' + path
    end
  end

end
