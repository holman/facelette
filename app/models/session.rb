class Session < ActiveRecord::Base

  def self.available(session)
    @session = Session.find(:first, 
        :conditions => ["id != ? AND last_checked > ?", 
                        session[:id], 1.minute.ago],
        :order => 'random()')
  end

end
