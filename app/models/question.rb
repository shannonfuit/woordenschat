# multiple choice questions
class Question < ActiveRecord::Base
  mount_uploader :hintimage, HintimageUploader
  belongs_to :level
  has_many :answers

  def next
    where('id > ? AND level_id = ?', id, level_id).first
  end
end
