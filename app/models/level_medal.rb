# superclass for level medals
class LevelMedal < Medal
  validates_presence_of :level_number
end
