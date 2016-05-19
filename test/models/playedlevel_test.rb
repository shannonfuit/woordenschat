# require 'test_helper'

# class PlayedlevelTest < ActiveSupport::TestCase
# 	self.use_transactional_fixtures = true
#  	# test "the truth" do
#   	#   assert true
#  	# end

#  	test "a playedlevel with less than 6 correct answers delivers 0 stars" do
# 		playedlevel = correct_answered(5)
# 		assert_equal(0, playedlevel.stars)
# 	end

# 	test "a playedlevel with 6 correct answers delivers 1 stars" do
# 		playedlevel = correct_answered(6)
# 		assert_equal(1, playedlevel.stars)
# 	end

# 	test "a playedlevel with 8 correct answers delivers 2 stars" do
# 		playedlevel = correct_answered(8)
# 		assert_equal(2, playedlevel.stars)
# 	end

# 	test "a playedlevel with 10 correct answers delivers 3 stars" do
# 		playedlevel = correct_answered(10)
# 		assert_equal(3, playedlevel.stars)
# 	end

# 	def correct_answered(count)
# 		playedlevel = Playedlevel.new
# 		playedlevel.level = levels(:one)
# 		playedlevel.user = users(:one)
# 		playedlevel.started_at = Time.zone.now

# 		i = 1;
# 		Question.all.each { |e|
# 			e.level = playedlevel.level
# 			e.save
# 			answer = Answer.new
# 			answer.question = e
# 		    answer.user = users(:one)
# 		    if(i <= count)
# 		    	# right answer
# 		    	answer.submit(1)
# 		    else
# 		    	# wrong answer
# 		    	answer.submit(2)
# 		    end
# 		    answer.playedlevel = playedlevel
# 		    answer.save
# 		    i += 1
# 		}
# 		playedlevel.save
# 		playedlevel.ended_at

# 		# puts "qcount: " + playedlevel.level.questions.count.to_s
# 		# puts "cscore: " + playedlevel.correct_score.to_s
# 		# puts "score: " + playedlevel.score.to_s
# 		playedlevel
# 	end
# end
