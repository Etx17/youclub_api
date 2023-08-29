# Clear existing records (optional)
Club.destroy_all
Activity.destroy_all
SubGroup.destroy_all
Schedule.destroy_all
TimeSlot.destroy_all
User.destroy_all

# Seed users
users = []
2.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: 'my_encrypted_password'
  )
end
users << User.create!(
  email: 'etiennededianous@gmail.com',
  password: 'my_encrypted_password'
)
selectedCategory = "Sports, activités de plein air";
selectedSubCategory = "Aviron, canoë kayak (aviron, rafting, canoë kayak, joutes)"
possibleTypeOfActivity= ['cours collectif', 'cours particulier', 'stage', 'atelier', 'session', 'évènement', 'autre'];
examplesOfSubGroupNames= ['Débutant', 'Ados 12-15', 'Tout public', 'Confirmés', 'Ceinture Noire', 'Votre catégorie']

# Seed clubs
clubs = []
2.times do |i|
  clubs << Club.create!(
    name: "Club #{i + 1}",
    rna_number: Faker::Alphanumeric.alphanumeric(number: 8),
    geo_point: "#{Faker::Address.longitude}, #{Faker::Address.latitude}",
    category: selectedCategory,
    subcategory: selectedSubCategory,
    address: Faker::Address.full_address,
    actual_zipcode: "75017",
    nearbyStation: Faker::Company.name,
    website: Faker::Internet.url,
    objet: Faker::Company.catch_phrase,
    user: users.sample
  )
end

# Seed activities
activities = []
clubs.each do |club|
  activities << Activity.create!(
    name: Faker::Lorem.words(number: 2).join(' ').capitalize,
    geo_point: club.geo_point,
    category: club.category,
    address: club.address,
    actual_zipcode: club.actual_zipcode,
    free_trial: Faker::Boolean.boolean,
    is_looking_for_volunteer: Faker::Boolean.boolean,
    subcategories: club.subcategory,
    recurrence: Faker::Lorem.word,
    subscription_link: "#{club.website}/subscribe",
    short_description: Faker::Lorem.sentence,
    full_description: Faker::Lorem.paragraph,
    club: club
  )
end

# Seed subgroups
sub_groups = []
activities.each do |activity|
  sub_groups << SubGroup.create!(
    activity: activity,
    class_type: possibleTypeOfActivity.sample,
    name: examplesOfSubGroupNames.sample,
    min_price_cents: Faker::Commerce.price(range: 5.0..50.0),
    max_price_cents: Faker::Commerce.price(range: 50.0..100.0),
    recurrence: Faker::Lorem.word,
    short_description: Faker::Lorem.sentence,
    subscription_by_reccurence_price_cents: Faker::Commerce.price(range: 30.0..100.0),
    tarifications: [Faker::Commerce.price, Faker::Commerce.price, Faker::Commerce.price].map { |price| "#{price}/mois" }
  )
end

# Seed schedules and time slots
schedules = []
sub_groups.each do |sub_group|
  3.times do
    schedule = Schedule.create!(
      sub_group: sub_group,
      day: ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"].sample
    )
    schedules << schedule

    # Seed time slots for each schedule
    5.times do
      TimeSlot.create!(
        schedule: schedule,
        start_time: "8:00",
        end_time: "10:00"
      )
    end
  end
end
