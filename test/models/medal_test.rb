require 'test_helper'

class MedalTest < ActiveSupport::TestCase
	self.use_transactional_fixtures = true
 	test "adds a AllMedalsMedal to user" do
 		medal = AllMedalsMedal.create({ 
 			name: 'Alle trofeeen behaald',
 			description: 'Haal alle trofeeen',
 			xp: 1000,
 			levelnumber: 1})
 		user = users(:one)

		medal.judge(user)
		assert_includes( user.medals, medal )
	end
end
