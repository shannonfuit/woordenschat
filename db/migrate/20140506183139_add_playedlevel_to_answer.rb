class AddPlayedlevelToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :playedlevel, index: true
  end
end
