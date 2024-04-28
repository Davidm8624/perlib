class ApplicationController < ActionController::Base
  # counts the ammount of times the user had been to the site using cookies
  before_action :count_request_in_session

  def count_request_in_session
    session[:request] ||= 0 # starts it at 0 if it didnt detect a request value yet
    session[:request] += 1
  end
end
