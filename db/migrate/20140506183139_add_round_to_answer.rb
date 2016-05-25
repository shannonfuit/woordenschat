class AddRoundToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :round, index: true
  end
end
