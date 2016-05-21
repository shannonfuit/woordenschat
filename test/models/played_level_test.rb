require 'test_helper'

class PlayedLevelTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  # test "the truth" do
  #   assert true
  # end

  test 'a played_level with less than 6 correct answers delivers 0 stars' do
    played_level = correct_answered(5)
    assert_equal(0, played_level.stars)
  end

  test 'a played_level with 6 correct answers delivers 1 stars' do
    played_level = correct_answered(6)
    assert_equal(1, played_level.stars)
  end

  test 'a played_level with 8 correct answers delivers 2 stars' do
    played_level = correct_answered(8)
    assert_equal(2, played_level.stars)
  end

  test 'a played_level with 10 correct answers delivers 3 stars' do
    played_level = correct_answered(10)
    assert_equal(3, played_level.stars)
  end

  def correct_answered(count)
    played_level = PlayedLevel.create(
      level: levels(:one),
      user: users(:one),
      started_at: Time.zone.now
    )

    i = 1
    Question.all.each do |question|
      question.update_attributes level: played_level.level

      answer = played_level.answers.create(
        question: question,
        user: users(:one)
      )
      if i <= count
        # right answer
        answer.submit(1)
      else
        # wrong answer
        answer.submit(2)
         end
      i += 1
    end
    played_level.close

    # puts "qcount: " + played_level.level.questions.count.to_s
    # puts "cscore: " + played_level.correct_score.to_s
    # puts "score: " + played_level.score.to_s
    played_level
  end
end
