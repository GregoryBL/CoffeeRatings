require_relative '../config/application' 

users = ["Greg Berns-Leone", "Alex Sippel", "Leul Bezane"]
roasters = [
  ["Stumptown Coffee Roasters", "Portland"], 
  ["Dark Matter Coffee", "Chicago"], 
  ["Blue Bottle Coffee", "New York City"], 
  ["Metropolis Coffee Company", "Chicago"], 
  ["Intelligentsia Coffee", "Chicago"]
]
preparations = [
  ["Latte", "Espresso"], 
  ["Americano", "Espresso"],
  ["French Press", "Immersion"],
  ["Aeropress", "Immersion"],
  ["Moka Pot", "Percolator"]
]
coffees = [
  ["Mzuzu", "Malawi", "Mzuzu Coffee Planters Cooperative", DateTime.new(2016, 7, 25), "Blue Bottle Coffee"],
  ["A Love Supreme", "Blend", nil, DateTime.new(2016, 7, 25), "Dark Matter Coffee"]
]
preparers = [
  ["Home", "Chicago", "Greg Berns-Leone"],
  ["Standing Passengers", "Chicago", nil],
  ["Home", "Chicago", "Alex Sippel"]
]
reviews = [
  [1, 2, 1, 3, DateTime.now, 9, "Chocolaty and delicious"],
  [1, 1, 1, 3, DateTime.now, 9, nil]
]

users.each { |u| User.find_or_create_by(name: u) }
roasters.each { |r| Roaster.find_or_create_by(name:r[0], city:r[1]) }
preparations.each { |p| Preparation.find_or_create_by(name:p[0], preparation_type:p[1]) }
coffees.each do |c|
  Coffee.find_or_create_by(name:c[0], country: c[1], farm: c[2], roast_date: c[3], roaster: Roaster.find_by(name: c[4]))
end
preparers.each { |p| Preparer.find_or_create_by(name: p[0], city: p[1], person: p[2]) }
reviews.each do |r|
  u = User.find(r[0])
  c = Coffee.find(r[1])
  prep_r = Preparer.find(r[2])
  prep_ion = Preparation.find(r[3])
  Review.find_or_create_by(user: u, coffee: c, preparer: prep_r, preparation: prep_ion, date: r[4], rating: r[5], comments: r[6])
end
