class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :done

  def done
    render :controller => 'sessions', :action => 'done'
  end
end
