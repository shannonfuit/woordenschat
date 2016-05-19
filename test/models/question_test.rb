require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test 'get next question of level' do
    level_1 = levels(:one)
    level_2 = levels(:two)
    Question.create(level: level_1)
    Question.create(level: level_2)
    Question.create(level: level_1)
    assert_equal(level_1.questions.last, level_1.questions.first.next)
  end
end
