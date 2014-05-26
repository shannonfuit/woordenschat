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
{ word: 'kanttekening', ans1: 'angst voor examenwoorden', ans2: 'verzadigingspunt', ans3: 'variant op buitenspelregel', ans4: 'kleine, kritische opmerking', hintsemantic: 'feedbackpunt',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   { word: 'amputeren', ans1: 'verlangen naar vroeger', ans2: 'vernieuwen', ans3: 'afzetten', ans4: 'bevrijden van beperkingen of belemmeringen', hintsemantic: 'ledematen',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 3 ,level_id: levels.first.id },
   { word: 'innoveren', ans1: 'tot beroep maken', ans2: 'een lijstje maken van spullen of punten', ans3: 'in een lijst hangen', ans4: 'vernieuwen', hintsemantic: 'verandering',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   { word: 'authentieke', ans1: 'indrukwekkende', ans2: 'echte, originele', ans3: 'groene', ans4: 'tegenstrijdig lijkende', hintsemantic: 'niet vervalst',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 2 ,level_id: levels.first.id },
   { word: 'monumentale', ans1: 'indrukwekkende', ans2: 'banaanvormige', ans3: 'geflipte', ans4: 'paarse', hintsemantic: 'groots',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1 ,level_id: levels.first.id },
   { word: 'nostalgie', ans1: 'verlangen naar feedback', ans2: 'verlangen naar vroeger', ans3: 'angst voor spinnen', ans4: 'angst voor lange woorden', hintsemantic: 'oma',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 2 ,level_id: levels.first.id },
   { word: 'diversiteit', ans1: 'verkenning', ans2: 'nalatigheid', ans3: 'prototype', ans4: 'verscheidenheid', hintsemantic: 'variatie',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   { word: 'exploratie', ans1: 'nalatigheid', ans2: 'vorm van griep', ans3: 'verkenning', ans4: 'vaardigheid', hintsemantic: 'jungletocht',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 3 ,level_id: levels.first.id },
   { word: 'nihil', ans1: 'niets', ans2: 'weinig', ans3: 'veel', ans4: 'alles', hintsemantic: '...',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1 ,level_id: levels.first.id },
   { word: 'evalueren', ans1: 'onderzoeken wat goed en slecht aan iets is', ans2: 'de blijde boodschap brengen', ans3: 'een lijstje maken van spullen of punten', ans4: 'naar een hogere klasse of functie gaan', hintsemantic: 'rapport',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1,level_id: levels.first.id },
   { word: 'impuls', ans1: 'oppepper', ans2: 'verzuim', ans3: 'soort koe', ans4: 'lavalamp', hintsemantic: 'prikkel',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1 ,level_id: levels.first.id },
   { word: 'paradoxaal', ans1: 'roestig', ans2: 'brutaal', ans3: 'vermoeiend lijkend', ans4: 'tegenstrijdig lijkend', hintsemantic: 'omverenigbaar',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   { word: 'esthetische', ans1: 'of iets goed of slecht is', ans2: 'die met schoonheid te maken heeft', ans3: 'indrukwekkende', ans4: 'Griekse', hintsemantic: 'mooi',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 2 ,level_id: levels.first.id },
   { word: 'ethische', ans1: 'of iets goed of slecht is', ans2: 'die met schoonheid te maken heeft', ans3: 'indrukwekkende', ans4: 'Griekse', hintsemantic: 'braaf',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1 ,level_id: levels.first.id },
   { word: 'significant', ans1: 'vierkant', ans2: 'glinsterend', ans3: 'uitdagend', ans4: 'veelbetekenend', hintsemantic: 'opvallend',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   { word: 'defenestreren', ans1: 'glas breken', ans2: 'veters strikken', ans3: 'uit het raam gooien', ans4: 'vingerverf gebruiken', hintsemantic: 'venster',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 3 ,level_id: levels.first.id },
   { word: 'glamourwereld', ans1: 'wereld waarin alles mag', ans2: 'ideale wereld', ans3: 'wereld van schone schijn', ans4: 'wereld vol kakkerlakken', hintsemantic: 'voetbalvrouwen',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 3 ,level_id: levels.first.id },
   { word: 'consulteren', ans1: 'raadplegen', ans2: 'hoofdpijn bezorgen', ans3: 'snotneus krijgen', ans4: 'scriptie schrijven', hintsemantic: 'advies',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1 ,level_id: levels.first.id },
   { word: 'egaliseren', ans1: 'braken', ans2: 'gelijkmaken', ans3: 'onvoldoende geven', ans4: 'salto springen', hintsemantic: 'vlak',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 2 ,level_id: levels.first.id },
   { word: 'militant', ans1: 'voorrang', ans2: 'strijdbaar', ans3: 'zelfverzekerd', ans4: 'veeleisend', hintsemantic: 'gevecht',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 2 ,level_id: levels.first.id },
   { word: 'ambivalent', ans1: 'zelfverzekerd', ans2: 'veeleisend', ans3: 'gestippeld', ans4: 'tweeslachtig', hintsemantic: 'dubbel',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   { word: 'authentiek', ans1: 'origineel', ans2: 'rumoerig', ans3: 'onbaatzuchtig', ans4: 'kritisch', hintsemantic: 'niet-nagemaakt',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1 ,level_id: levels.first.id },
   { word: 'dogma', ans1: 'verduistering', ans2: 'lavalamp', ans3: 'geloofsbeginsel', ans4: 'krabpaal', hintsemantic: 'geen discussie',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 3 ,level_id: levels.first.id },
   { word: 'flatteus', ans1: 'met boeken vullend', ans2: 'er leuk uitziend', ans3: 'groen', ans4: 'winderig', hintsemantic: 'mooi',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 2 ,level_id: levels.first.id },
   { word: 'excessief', ans1: 'buitensporig', ans2: 'uniek', ans3: 'liefdevol', ans4: 'kritisch', hintsemantic: 'extreem',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 1 ,level_id: levels.first.id },
   { word: 'provocatie', ans1: 'voltijdstudie', ans2: 'potpalm', ans3: 'uitdaging', ans4: 'horlogemaker', hintsemantic: 'uitlokken',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 3 ,level_id: levels.first.id },
   { word: 'feminisering', ans1: 'negeren van buitenspelregel', ans2: 'sturen van kaartje', ans3: 'toenemen invloed van vrouwen', ans4: 'spelen van games', hintsemantic: 'meisjes',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 3 ,level_id: levels.first.id },
   { word: 'imponeren', ans1: 'optocht houden', ans2: 'twisten', ans3: 'provoceren', ans4: 'indruk maken', hintsemantic: 'stoer',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   { word: 'improviseren', ans1: 'ophangen', ans2: 'onvoorbereid uitvoeren', ans3: 'aanschaffen', ans4: 'indruk maken', hintsemantic: 'toneel',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 2 ,level_id: levels.first.id },
   { word: 'sedert', ans1: 'kerstboom', ans2: 'spaarvarken', ans3: 'pollepel', ans4: 'sinds', hintsemantic: 'vanaf',
   hintsentence: 'Hier komt nog een zin.', hintimage: '', anscorrect: 4 ,level_id: levels.first.id },
   ])





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



 # self.password_salt = BCrypt::Engine.generate_salt
 #      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)