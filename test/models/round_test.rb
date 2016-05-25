require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  # test "the truth" do
  #   assert true
  # end

  test 'a round with less than 6 correct answers delivers 0 stars' do
    round = correct_answered(5)
    assert_equal(0, round.stars)
  end

  test 'a round with 6 correct answers delivers 1 stars' do
    round = correct_answered(6)
    assert_equal(1, round.stars)
  end

  test 'a round with 8 correct answers delivers 2 stars' do
    round = correct_answered(8)
    assert_equal(2, round.stars)
  end

  test 'a round with 10 correct answers delivers 3 stars' do
    round = correct_answered(10)
    assert_equal(3, round.stars)
  end

  def correct_answered(count)
    round = Round.create(
      level: levels(:one),
      user: users(:one),
    )

    i = 1
    Question.all.each do |question|
      question.update_attributes level: round.level

      answer = round.answers.create(
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
    round.close

    # puts "qcount: " + round.level.questions.count.to_s
    # puts "cscore: " + round.correct_score.to_s
    # puts "score: " + round.score.to_s
    round
  end
end
