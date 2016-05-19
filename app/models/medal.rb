class Medal < ActiveRecord::Base
  # call to have the medal judge and apply itself when valid to the users achievements.
  def judge(_user, _playedlevel)
    raise NotImplementedError, 'You must implement this on the derived type'
  end
end
