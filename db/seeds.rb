User.destroy_all
Flat.destroy_all
Review.destroy_all

# Landlords
laura = User.create(first_name:'Laura', last_name:'Meyer', email:'laura@gmail.com',
  landlord: true)
marc = User.create(first_name:'Marc', last_name:'Lachartre', email:'marc@gmail.com',
  landlord: true)
alois = User.create(first_name:'Alois', last_name:'Beard', email:'alois@gmail.com',
  landlord: true)

# Tenants
killian = User.create(first_name:'Killian', last_name:'Guacide', email:'killian@gmail.com')
filippo = User.create(first_name:'Filippo', last_name:'Tognacci', email:'filippo@gmail.com')
amir = User.create(first_name:'Amir', last_name:'Yosef', email:'amir@gmail.com')


# Flats
flat1 = Flat.create(address:'Korte Bergstraat 2B, 3811 ML Amersfoort',
  bedrooms:1, size:42, build_year:1985, deposit_amount:1000, description:
  'Charming 1 bedroom apartment with a large bedroom and plenty of storage space.
  The apartment is in a quiet street close to many amenities and a 10min walk to
  Amersfoort train station.', rental_price:900, landlord_id:1, tenant_id:1)

flat2 = Flat.create(address:'Korte Prinsengracht 24, 1013 GS Amsterdam',
  bedrooms:2, size:85, build_year:1964, deposit_amount:1800, description:
  'Modern 2 bedroom apartment in central Amsterdam. The apartment boasts
  2 double sized bedrooms, a large bathroom with bath shower and a separate
  toilet room. Modern kitchen with plenty of natural light. The apartment is a 10
  minute walk to Amsterdam Centraal station and has plenty of shops and restuarants
  close by.', rental_price:2100, landlord_id:2, tenant_id:2)

flat3 = Flat.create(address:'Baarsjesweg 192B, 1057 HR Amsterdam',
  bedrooms:2, size:82, build_year:1958, deposit_amount:2000, description:
  'Recently renovated 2 bedroom apartment in the heart of Oud West. The apartment
  was renovated in 2017 and boasts a modern and sleek finish. Plenty of
  storage and 2 large bedrooms. The bathroom has a large rain shower and separate
  his and her basins. 5min walk to the metro.', rental_price:2400, landlord_id:3, tenant_id:3)

review1 = Review.new(rating:4, comment:'Amazing apartment but on a noisy street.', flat_id:1)

review2 = Review.new(rating:2, comment:'Huge damp problem in the flat.', flat_id:2)


