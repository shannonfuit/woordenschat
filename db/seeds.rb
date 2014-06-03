# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Create test user

# Levels

#    t.integer  ""]
levels = Level.create([
    {number: 1, openingdate: Time.now, closingdate: Time.now + 1},
    {number: 2, openingdate: Time.now, closingdate: Time.now + 1},
    {number: 3, openingdate: Time.now, closingdate: Time.now + 1},
    {number: 4, openingdate: Time.now, closingdate: Time.now + 1},
    {number: 5, openingdate: Time.now, closingdate: Time.now + 1},
    {number: 6, openingdate: Time.now, closingdate: Time.now + 1},
    ])


questionslevel1 = Question.create([
  { word: 'selfie', ans1: 'geschilderd landschap', ans2: 'geschilderd zelfportret', ans3: 'gefotografeerd landschap', ans4: 'gefotografeerd zelfportret', hintsemantic: 'otofoto',
    hintsentence: 'Omdat er niemand in de buurt was, maakte de toerist een selfie.', hintimage: '', anscorrect: 4, level_id: 1 }])

DeadlineMedal.create([
    { name: 'Deadline level 1', description: 'Speel level 1 voor de sluitingsdatum', xp: 1000, levelnumber: 1 },
    { name: 'Deadline level 2', description: 'Speel level 2 voor de sluitingsdatum', xp: 1000, levelnumber: 2 },
    { name: 'Deadline level 3', description: 'Speel level 3 voor de sluitingsdatum', xp: 1000, levelnumber: 3 },
    { name: 'Deadline level 4', description: 'Speel level 4 voor de sluitingsdatum', xp: 1000, levelnumber: 4 },
    { name: 'Deadline level 5', description: 'Speel level 5 voor de sluitingsdatum', xp: 1000, levelnumber: 5 },
    { name: 'Deadline level 6', description: 'Speel level 6 voor de sluitingsdatum', xp: 1000, levelnumber: 6 },
    ])

NoHintsMedal.create([
    { name: 'Geen hints level 1', description: 'Geen hints gebruikt in level 1', xp: 1000, levelnumber: 1 },
    { name: 'Geen hints level 2', description: 'Geen hints gebruikt in level 2', xp: 1000, levelnumber: 2 },
    { name: 'Geen hints level 3', description: 'Geen hints gebruikt in level 3', xp: 1000, levelnumber: 3 },
    { name: 'Geen hints level 4', description: 'Geen hints gebruikt in level 4', xp: 1000, levelnumber: 4 },
    { name: 'Geen hints level 5', description: 'Geen hints gebruikt in level 5', xp: 1000, levelnumber: 5 },
    { name: 'Geen hints level 6', description: 'Geen hints gebruikt in level 6', xp: 1000, levelnumber: 6 },
    ])

ThreeStarMedal.create([
    { name: '3 Sterren level 1', description: 'Haal drie sterren in level 1', xp: 1000, levelnumber: 1 },
    { name: '3 Sterren level 2', description: 'Haal drie sterren in level 2', xp: 1000, levelnumber: 2 },
    { name: '3 Sterren level 3', description: 'Haal drie sterren in level 3', xp: 1000, levelnumber: 3 },
    { name: '3 Sterren level 4', description: 'Haal drie sterren in level 4', xp: 1000, levelnumber: 4 },
    { name: '3 Sterren level 5', description: 'Haal drie sterren in level 5', xp: 1000, levelnumber: 5 },
    { name: '3 Sterren level 6', description: 'Haal drie sterren in level 6', xp: 1000, levelnumber: 6 },
    ])

TwentyFiveInRowMedal.create([
    { name: '25 Vragen achter elkaar goed', description: 'Beantwoord 25 vragen achter elkaar correct', xp: 1000, levelnumber: 1 }
    ])

FiftyInRowMedal.create([
    { name: '50 Vragen achter elkaar goed', description: 'Beantwoord 50 vragen achter elkaar correct', xp: 1000, levelnumber: 1 }
    ])

HundredInRowMedal.create([
    { name: '100 Vragen achter elkaar goed', description: 'Beantwoord 100 vragen achter elkaar correct', xp: 1000, levelnumber: 1 }
    ])
HundredMedal.create([
    { name: '100 Vragen goed', description: 'Beantwoord 100 vragen correct', xp: 1000, levelnumber: 1 }
    ])
ThousandMedal.create([
    { name: '1000 Vragen Goed', description: 'Beantwoord 1000 vragen correct', xp: 1000, levelnumber: 1 }
    ])
ThousandMedal.create([
    { name: 'Alle trofeeen behaald', description: 'Haal alle trofeeen', xp: 1000, levelnumber: 1 }
    ])
 # self.password_salt = BCrypt::Engine.generate_salt
 #      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)