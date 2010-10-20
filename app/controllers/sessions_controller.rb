class SessionsController < ApplicationController
  def index
    @session = Session.new
  end

  def create
    @session = Session.create(params[:session])
    session[:id] = @session.id
    redirect_to :queue
  end

  def queue
    @me = Session.find_by_id(session[:id])
    return redirect_to(:action => :index) unless @me

    @me.touch(:last_checked)
    @session = Session.available(session)
  end
end
