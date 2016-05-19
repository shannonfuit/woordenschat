class AddPlayedLevelToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :played_level, index: true
  end
end
