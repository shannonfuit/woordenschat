require 'test_helper'

class MedalTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = true

  test 'adds an AllMedalsMedal to user' do
    medal = AllMedalsMedal.create(name: 'Alle trofeeen behaald',
                                  description: 'Haal alle trofeeen',
                                  xp: 1000,
                                  level_number: 1)
    user = users(:one)

    medal.judge(user)
    assert_includes(user.medals, medal)
  end

  test 'adds a DeadlineMedal to user' do
    user = users(:one)
    level = Level.create(number: 1,
                         openingdate: Time.now,
                         closingdate: Time.now + 2)

    played_level = Playedlevel.create(startlevel: Time.zone.now,
                                      ended_at: Time.zone.now + 1,
                                      user: user,
                                      level: level)

    medal = DeadlineMedal.create(name: 'Deadline level 1',
                                 description: 'Speel level 1 voor de sluitingsdatum',
                                 xp: 1000,
                                 level_number: 1)

    medal.judge(user, played_level)
    assert_includes(user.medals, medal)
  end

  test 'adds a HundredMedal to user' do
    user = users(:one)
    1.times {user.answers.create({correct_answered: true})}
    1.times {user.answers.create({correct_answered: false})}
    99.times {user.answers.create({correct_answered: true}) }
    medal = HundredMedal.create(name: '100 vragen goed',
                                 description: 'Beantwoord 100 vragen correct',
                                 xp: 1000)

    medal.judge(user)
    assert_includes(user.medals, medal)
  end

    test 'adds a Hundred in a row Medal to user' do
    user = users(:one)
    1.times {user.answers.create({correct_answered: false}) }
    100.times {user.answers.create({correct_answered: true}) }
    medal = HundredInRowMedal.create(name: '100 vragen goed',
                                 description: 'Beantwoord 100 vragen achter elkaar correct',
                                 xp: 1000)

    medal.judge(user)
    assert_includes(user.medals, medal)
  end
end