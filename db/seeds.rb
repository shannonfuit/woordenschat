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
    {number: 2, openingdate: Time.now + 3600, closingdate: Time.now + 7200}
    ])
q1 = Question.create([
	{ word: 'Harry',
    ans1: 'Hagenees',
    ans2: 'Amsterdammer',
    ans3: 'Mug',
    ans4: 'Kakkerlak',
    hintsemantic: 'Hagenaar',
    hintsentence: 'Zegt vaak kanker',
    hintimage: '',
    anscorrect: 1,
    level_id: levels.first.id }])

NoHintsMedal.create([
    { name: 'Geen hints level 1', description: 'Geen hints gebruikt in level 1', xp: 500, levelnumber: 1 },
    { name: 'Geen hints level 2', description: 'Geen hints gebruikt in level 2', xp: 500, levelnumber: 2 }
    ])

ThreeStarMedal.create([
    { name: '3 Sterren level 1', description: 'Haal drie sterren op level 1', xp: 500, levelnumber: 1 },
    { name: '3 Sterren level 2', description: 'Haal drie sterren op level 2', xp: 500, levelnumber: 2 }
    ])

DeadlineMedal.create([
    { name: 'Deadline level 1', description: 'Speel level 1 voor de sluitingsdatum ', xp: 500, levelnumber: 1 },
    { name: 'Deadline level 2', description: 'Speel level 2 voor de sluitingsdatum', xp: 500, levelnumber: 2 }
    ])

 # self.password_salt = BCrypt::Engine.generate_salt
 #      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)