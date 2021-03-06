Flat.destroy_all
Review.destroy_all
User.destroy_all

# Landlords
laura = User.create!(first_name:'Laura', last_name:'Meyer', email:'laura@gmail.com',
  landlord: true, password:'111111')
marc = User.create!(first_name:'Marc', last_name:'Lachartre', email:'marc@gmail.com',
  landlord: true, password:'111111')
alois = User.create!(first_name:'Alois', last_name:'Beard', email:'alois@gmail.com',
  landlord: true, password:'111111')
sophie = User.create!(first_name:'Sophie', last_name:'Spyropoulos', email:'cath@gmail.com',
  landlord: true, password:'111111')
shivani = User.create!(first_name:'Shivani', last_name:'Goolab', email:'shiv@gmail.com',
  landlord: true, password:'111111')
natasha = User.create!(first_name:'Natasha', last_name:'Coates', email:'tash@gmail.com',
  landlord: true, password:'111111')
charlotte = User.create!(first_name:'Charlotte', last_name:'Bosley', email:'charlotte@gmail.com',
  landlord: true, password:'111111')
daniel = User.create!(first_name:'Daniel', last_name:'Kramer', email:'daniel@gmail.com',
  landlord: true, password:'111111')
abi = User.create!(first_name:'Abi', last_name:'Wright', email:'abi@gmail.com',
  landlord: true, password:'111111')
matthew = User.create!(first_name:'Matthew', last_name:'Donovan', email:'matt@gmail.com',
  landlord: true, password:'111111')

# Tenants
killian = User.create!(first_name:'Killian', last_name:'Guacide', email:'killian@gmail.com', password:'111111')
filippo = User.create!(first_name:'Filippo', last_name:'Tognacci', email:'filippo@gmail.com', password:'111111')
amir = User.create!(first_name:'Amir', last_name:'Yosef', email:'amir@gmail.com', password:'111111')
tinco = User.create!(first_name:'Tinco', last_name:'Andringa', email:'tinco@gmail.com', password:'111111')
carmen = User.create!(first_name:'Carmen', last_name:'Lamb', email:'carmen@gmail.com', password:'111111')
tristin = User.create!(first_name:'Tristin', last_name:'Humphreys', email:'tristin@gmail.com', password:'111111')
kevin = User.create!(first_name:'Kevin', last_name:'Huber', email:'kevin@gmail.com', password:'111111')
anthony = User.create!(first_name:'Anthony', last_name:'Donatelli', email:'anthony@gmail.com', password:'111111')
carly = User.create!(first_name:'Carly', last_name:'Newton', email:'carly@gmail.com', password:'111111')
rakan = User.create!(first_name:'Rakan', last_name:'Gardner', email:'rakan@gmail.com', password:'111111')
jason = User.create!(first_name:'Jason', last_name:'Katz', email:'jason@gmail.com', password:'111111')
romy = User.create!(first_name:'Romy', last_name:'Green', email:'romy@gmail.com', password:'111111')
tina = User.create!(first_name:'Tina', last_name:'Alevizos', email:'tina@gmail.com', password:'111111')
david = User.create!(first_name:'David', last_name:'Santos', email:'david@gmail.com', password:'111111')
frederik = User.create!(first_name:'Frederik', last_name:'Blanc', email:'frederik@gmail.com', password:'111111')
mitch = User.create!(first_name:'Mitch', last_name:'Thomas', email:'mitch@gmail.com', password:'111111')
michelle = User.create!(first_name:'Michelle', last_name:'Stott', email:'michelle@gmail.com', password:'111111')
alois = User.create!(email: "alois.beard@laposte.net", username: nil, first_name: 'Alois', last_name: 'Beard', password:'111111', profile_pic: nil, provider: "facebook", uid: "10157089276935030", friends: [{"id"=>"10155944089180927", "name"=>"Catherine Spyropoulos"}])
catherine = User.create!(email: "catspy@webmail.co.za", username: nil, first_name: 'Catherine', last_name: 'Spyropoulos', password:'111111', profile_pic: nil, provider: "facebook", uid: "10155944089180927", friends: [{"id"=>"10157089276935030", "name"=>"Alois Beard"}])
# Flats
flat1 = Flat.create!(address:'Bilderdijkkade 46, Amsterdam', bedrooms:1, size:80, build_year:1985, price_cents:75000, description:
  'Charming 1 bedroom apartment with a large bedroom and plenty of storage space. Large and bright living room.
  The apartment is in a quiet street along the canal, close to many amenities and a 2min walk to
  Foodhallen and Kinkerstraat.', rental_price:900, landlord:laura, tenant:killian, bathrooms:1, letting_status:"confirmed", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment1A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment1B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment1C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment1D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment1E.jpg')

flat2 = Flat.create!(address:'Korte Prinsengracht 24, Amsterdam',
  bedrooms:2, size:85, build_year:1964, price_cents:85000, description:
  'Modern 2 bedroom apartment in central Amsterdam with a large bathroom with bath shower and a separate
  toilet room. Modern kitchen with plenty of natural light. The apartment is a 10
  minute walk to Amsterdam Centraal station.', rental_price:1900, landlord:marc, tenant:filippo, bathrooms:1, letting_status:"pending", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment2A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment2B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment2C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment2D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment2E.jpg')

flat3 = Flat.create!(address:'Baarsjesweg 192B, Amsterdam',
  bedrooms:2, size:82, build_year:1958, price_cents:80000, description:
  'Recently renovated 2 bedroom apartment in the heart of Oud West. The apartment
  was renovated in 2017 and boasts a modern and sleek finish. Plenty of
  storage and 2 large bedrooms. The bathroom has a large rain shower.', rental_price:1950, landlord:alois, tenant:amir, bathrooms:2, letting_status:"pending", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment3C.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment3B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment3A.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment3D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment3E.jpg')

flat4 = Flat.create!(address:'Sarphatipark 34, Amsterdam',
  bedrooms:2, size:122, build_year:1975, price_cents:79000, description:
  'Large 2 bedroom apartment right by City Park. The apartment is a 2 bedroom 2 bathroom aparmtent
  with generous storage space and a recently refurbished kitchen. Close to the local cafes and shops and
  a 3 min walk to the metro.', rental_price:2400, landlord:sophie, available: true,
  tenant:tinco, bathrooms:2, letting_status:"pending",
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment4A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment4B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment4C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment4D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment4E.jpg')

flat5 = Flat.create!(address:'Tuinstraat 11, Amsterdam',
  bedrooms:2, size:102, build_year:1975, price_cents:85000, description:
  'Jordaan apartment close to the nine streets and the famous canals. This is a two bedroom one
  bathroom apartment with a modern finish. Close to a large range of restaurants and transportation.', rental_price:2600, landlord:shivani, tenant:carmen, bathrooms:2, letting_status:"pending", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment5A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment5B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment5C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment5D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment5E.jpg')

flat6 = Flat.create!(address:'Daniël Stalpertstraat 14, Amsterdam',
  bedrooms:1, size:48, build_year:1972, price_cents:75000, description:
  'Modern and large one bedroom, on the 2nd floor, in the heart of the trendy de Pijp area. Close to the metro with plenty of
  shops and cafes on its doorstep. Very bright living room, the apartment is close to the metro and is offered unfurnished.
  ', rental_price:2400, landlord:natasha, tenant:tristin, bathrooms:1, letting_status:"pending", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment6A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment6B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment6C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment6D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment6E.jpg')

flat7 = Flat.create!(address:'Den Texstraat 8, Amsterdam',
  bedrooms:2, size:88, build_year:1975, price_cents:69000, description:
  'Ground floor 2 bedroom apartment with a shared bathroom. Modern and sleek interior with a small
  back patio perfect for a sunny day. The apartment comes fully furnished with dishwasher, dryer and
  washing machine.', rental_price:2500, landlord:charlotte, tenant:kevin, bathrooms:1, letting_status:"pending", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment7A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment7B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment7C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment7D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment7E.jpg')

flat8 = Flat.create!(address:'Elisabeth Wolffstraat 10, Amsterdam',
  bedrooms:2, size:122, build_year:1935, price_cents:75000, description:
  'Recently renovated 2 bedroom apartment in the heart of Oud West. The apartment
  was renovated in 2017 and boasts a modern and sleek finish. The bathroom has a large rain shower. 5min walk to the metro.', rental_price:1900, landlord:daniel, tenant:anthony, bathrooms:2, letting_status:"pending", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment8A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment8B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment8C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment4D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment10E.jpg')

flat9 = Flat.create!(address:'Wilhelminastraat 22, Amsterdam',
  bedrooms:2, size:92, build_year:1982, price_cents:70000, description:
  'Stunning apartment in central Amsterdam close to all the major transport links. This two bedroom two
  bathroom apartment is offered fully furnished. Both bedrooms are double bedrooms. This apartment is on the top floor of a 4 storey building.',
  rental_price:2100, landlord:abi, tenant:carly, bathrooms:2, letting_status:"pending", available: true,
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment9A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment9B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment9C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment9D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment9E.jpg')

flat10 = Flat.create!(address:'Kerkstraat 322, Amsterdam',
  bedrooms:2, size:108, build_year:1960, price_cents:99000, description:
  'Clean smart apartment with wonderful west-facing views over the canals.
  Wood floors, open plan kitchen, large double bed bedrooms, sofa, shower room and matching furnishings.
  There is a washing machine downstairs within the building.',
  rental_price:2700, landlord:matthew, tenant:rakan, bathrooms:1, available: true, letting_status:"pending",
  remote_photo1_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment10A.jpg',
  remote_photo2_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment10B.jpg',
  remote_photo3_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment10C.jpg',
  remote_photo4_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment10D.jpg',
  remote_photo5_url:'https://res.cloudinary.com/dzlhbbkad/image/upload/v1551795007/apartment10E.jpg')
# Reviews
review1 = Review.create!(rating:4, comment:'Amazing apartment but on a noisy street.', flat:flat1, tenant:killian, area_rating: 3, noise_rating: 2, condition_rating: 5, energy_rating: 4, landlord_rating: 4, plumbing_rating: 4)
review2 = Review.create!(rating:3, comment:'Huge damp problem in the flat. Constant wet smell', flat:flat2, tenant:david, area_rating: 4, noise_rating: 4, condition_rating: 2, energy_rating: 2, landlord_rating: 2, plumbing_rating: 2)
review3 = Review.create!(rating:4, comment:'Great flat! Second bedroom lacks sufficient storage space though.', flat:flat3, tenant:filippo, area_rating: 3, noise_rating: 3, condition_rating: 5, energy_rating: 4, landlord_rating: 4, plumbing_rating: 4)
review4 = Review.create!(rating:5, comment:'Amazing flat and great landlord! Was very sad to move out.', flat:flat4, tenant:frederik, area_rating: 4, noise_rating: 5, condition_rating: 5, energy_rating: 4, landlord_rating: 5, plumbing_rating: 5)
review5 = Review.create!(rating:3, comment:'Beautiful apartment and great location but the windows do not have double glazing which makes the apartment quite noisy and cold in winter.', flat:flat5, tenant:mitch, area_rating: 5, noise_rating: 2, condition_rating: 4, energy_rating: 2, landlord_rating: 3, plumbing_rating: 4)
review6 = Review.create!(rating:2, comment:'Worst decision to live here! The apartment has a moss problem. When we move din it was not evident as the place had probably just been scraped and painted but after a few weeks the moss started to appear int he bathroom. My boyfriend started coughing within 2 months and my joints hurt.', flat:flat2, tenant:michelle,  area_rating: 4, noise_rating: 3, condition_rating: 1, energy_rating: 2, landlord_rating: 2, plumbing_rating: 1)
review7 = Review.create!(rating:4, comment:"Very nice flat and great building. Had no issues with it other than the second bedroom can get very cold in winter. We bought a plug in heater as the radiator doesn't seem to do the job in the second room", flat:flat1, tenant:tina,  area_rating: 4, noise_rating: 4, condition_rating: 4, energy_rating: 3, landlord_rating: 3, plumbing_rating: 4)
review8 = Review.create!(rating:3, comment:'Huge damp problem in the flat.', flat:flat3, tenant:anthony,  area_rating: 4, noise_rating: 4, condition_rating: 2, energy_rating: 3, landlord_rating: 2, plumbing_rating: 1)
review9 = Review.create!(rating:3, comment:'Huge damp problem in the flat.', flat:flat2, tenant:kevin,  area_rating: 3, noise_rating: 3, condition_rating: 3, energy_rating: 3, landlord_rating: 3, plumbing_rating: 1)
review10 = Review.create!(rating:5, comment:'Perfect flat in the perfect location. Had absolutely no problem with this flat in all 3 years I lived there.', flat:flat8, tenant:tristin,  area_rating: 5, noise_rating: 5, condition_rating: 5, energy_rating: 5, landlord_rating: 5, plumbing_rating: 5)
review11 = Review.create!(rating:5, comment:"Amazing flat and great landlord! Can't ask for a better location.", flat:flat1, tenant:romy,  area_rating: 5, noise_rating: 5, condition_rating: 4, energy_rating: 4, landlord_rating: 5, plumbing_rating: 5)
review12 = Review.create!(rating:3, comment:'Although this is a great looking flat, there is a huge heating problem. The water is only hot for small bursts of time so most of the showers I had when living there were cold. I eventually resorted to showering at the office or at the gym to avoid freezing.', flat:flat9, tenant:carmen,  area_rating: 4, noise_rating: 4, condition_rating: 3, energy_rating: 2, landlord_rating: 3, plumbing_rating: 2)

# Tenancies

tenancy1 = Tenancy.create!(flat:flat3, user:alois)
tenancy2 = Tenancy.create!(flat:flat1, user:catherine)


