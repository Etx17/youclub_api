Club.find_by(name: "Centre de Yoga Sivananda Paris")&.destroy
User.find_by(email: 'etiennededianous+3@gmail.com')&.destroy

etienne3 = User.create!(
  email: 'etiennededianous+3@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "5a9d1655-b54d-4670-a5eb-e3e954c9ec4f"
)

sivananda = Club.create(
  name: "Centre de Yoga Sivananda Paris",
  geo_point: "48.8748532, 2.3591712",
  objet: "Le centre de Yoga Sivananda offre de nombreuses possibilités pour approfondir sa pratique des postures et des exercises de respiration et pour découvrir de nouveaux aspects du Yoga.",
  category_number: "11000",
  subcategory_number: "11105",
  category: "Sports, activités de plein air",
  subcategory: "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic",
  address: "140 Rue du Faubourg Saint-Martin",
  actual_zipcode: "75010",
  user: etienne3,
  structure_type: 1,
  phone_number: '0140267749',
  website: "https://sivanandaparis.org/",
  adherence_fee: 20,
  is_premium: true
)

sivananda.photos.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'yoga.jpeg')),
  filename: 'yoga.jpeg',
  content_type: 'image/jpg'
)

photo_files = [
  Rails.root.join('app', 'assets', 'images', 'yoga.jpeg'),
  Rails.root.join('app', 'assets', 'images', 'yoga.jpeg'),
]
photo_files.each do |photo_path|
  sivananda.photos.attach(
    io: File.open(photo_path),
    filename: File.basename(photo_path),
    content_type: 'image/jpeg'
  )
end

yoga = Activity.create(
  name: "Yoga",
  category: "Sports, activités de plein air",
  category_number: "11000",
  subcategory_number: "11105",
  club: sivananda,
  geo_point: "48.8748532, 2.3591712",
  address: "135 rue Lamarck",
  actual_zipcode: "75010",
  free_trial: true,
  is_looking_for_volunteer: true,
  subcategories: "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic",
  recurrence: nil,
  subscription_link: nil,
  short_description: "Venez essayer gratuitement",
  full_description: "Le yoga est une discipline qui regroupe l'ensemble des pratiques ou disciplines corporelles et mentales ayant pour but l'unification de l'être humain dans ses aspects physique, psychique et spirituel.",
)

meditation = Activity.create(
  name: "Méditation",
  category: "Sports, activités de plein air",
  category_number: "11000",
  subcategory_number: "11105",
  club: sivananda,
  geo_point: "48.8748532, 2.3591712",
  address: "135 rue Lamarck",
  actual_zipcode: "75010",
  free_trial: true,
  is_looking_for_volunteer: true,
  subcategories: "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic",
  recurrence: nil,
  subscription_link: nil,
  short_description: "Venez essayer gratuitement",
  full_description: "La méditation est une discipline qui regroupe l'ensemble des pratiques ou disciplines corporelles et mentales ayant pour but l'unification de l'être humain dans ses aspects physique, psychique et spirituel.",
)

intermediate_subgroup = SubGroup.create(
  activity_id: yoga.id,
  name: "Pratique Intermédiaire",
  min_price_cents: 1900,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours pour intermédiaires. Approfondissez votre pratique du Yoga dans une ambiance chaleureuse.",
  subscription_by_recurrence_price_cents: 0,
)

a=Schedule.create(sub_group_id: intermediate_subgroup.id, day: "lundi")
b=Schedule.create(sub_group_id: intermediate_subgroup.id, day: "mardi")
c=Schedule.create(sub_group_id: intermediate_subgroup.id, day: "mercredi")
d=Schedule.create(sub_group_id: intermediate_subgroup.id, day: "jeudi")
e=Schedule.create(sub_group_id: intermediate_subgroup.id, day: "vendredi")
f=Schedule.create(sub_group_id: intermediate_subgroup.id, day: "samedi")
g=Schedule.create(sub_group_id: intermediate_subgroup.id, day: "dimanche")

[a, b, c, d, e].each do |s|
  TimeSlot.create(schedule_id: s.id, start_time: "2023-10-14T11:00:00.000Z", end_time: "2023-10-14T12:30:00.000Z")
  TimeSlot.create(schedule_id: s.id, start_time: "2023-10-14T11:00:00.000Z", end_time: "2023-10-14T12:30:00.000Z")
end

[b, c, d, e].each do |s|
  TimeSlot.create(schedule_id: s.id, start_time: "2023-10-14T12:30:00.000Z", end_time: "2023-10-14T14:00:00.000Z")
  TimeSlot.create(schedule_id: s.id, start_time: "2023-10-14T17:00:00.000Z", end_time: "2023-10-14T18:30:00.000Z")
end

TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T11:00:00.000Z", end_time: "2023-10-14T12:30:00.000Z")
TimeSlot.create(schedule_id: a.id, start_time: "2023-10-14T12:30:00.000Z", end_time: "2023-10-14T14:00:00.000Z")

[a, b, c].each do |s|
  TimeSlot.create(schedule_id: s.id, start_time: "2023-10-14T15:00:00.000Z", end_time: "2023-10-14T16:30:00.000Z")
end

[b, c, d, e].each do |s|
  TimeSlot.create(schedule_id: s.id, start_time: "2023-10-14T17:00:00.000Z", end_time: "2023-10-14T18:30:00.000Z")
end
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T16:00:00.000Z", end_time: "2023-10-14T17:30:00.000Z")
TimeSlot.create(schedule_id: g.id, start_time: "2023-10-14T16:00:00.000Z", end_time: "2023-10-14T17:30:00.000Z")
TimeSlot.create(schedule_id: a.id, start_time: "2023-10-14T18:30:00.000Z", end_time: "2023-10-14T20:00:00.000Z")
TimeSlot.create(schedule_id: b.id, start_time: "2023-10-14T18:30:00.000Z", end_time: "2023-10-14T20:00:00.000Z")
TimeSlot.create(schedule_id: c.id, start_time: "2023-10-14T18:30:00.000Z", end_time: "2023-10-14T20:00:00.000Z")
TimeSlot.create(schedule_id: a.id, start_time: "2023-10-14T20:00:00.000Z", end_time: "2023-10-14T21:30:00.000Z")
TimeSlot.create(schedule_id: b.id, start_time: "2023-10-14T20:00:00.000Z", end_time: "2023-10-14T21:30:00.000Z")





very_gentle_subgroup = SubGroup.create(
  activity_id: yoga.id,
  name: "Pratique très douce",
  min_price_cents: 1900,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours pour intermédiaires. Approfondissez votre pratique du Yoga dans une ambiance chaleureuse.",
  subscription_by_recurrence_price_cents: 0,
)

a=Schedule.create(sub_group_id: very_gentle_subgroup.id, day: "lundi")
c=Schedule.create(sub_group_id: very_gentle_subgroup.id, day: "mercredi")
d=Schedule.create(sub_group_id: very_gentle_subgroup.id, day: "jeudi")
f=Schedule.create(sub_group_id: very_gentle_subgroup.id, day: "samedi")
g=Schedule.create(sub_group_id: very_gentle_subgroup.id, day: "dimanche")

TimeSlot.create(schedule_id: a.id, start_time: "2023-10-14T11:00:00.000Z", end_time: "2023-10-14T12:30:00.000Z")
TimeSlot.create(schedule_id: c.id, start_time: "2023-10-14T18:30:00.000Z", end_time: "2023-10-14T20:00:00.000Z")
TimeSlot.create(schedule_id: d.id, start_time: "2023-10-14T18:30:00.000Z", end_time: "2023-10-14T20:00:00.000Z")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T16:00:00.000Z", end_time: "2023-10-14T17:30:00.000Z")
TimeSlot.create(schedule_id: g.id, start_time: "2023-10-14T16:00:00.000Z", end_time: "2023-10-14T17:30:00.000Z")

pregnant_women_subgroup = SubGroup.create(
  activity_id: yoga.id,
  name: "Femmes Enceintes",
  min_price_cents: 1900,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours de yoga adapté pour femmes enceintes",
  subscription_by_recurrence_price_cents: 0,
)
f=Schedule.create(sub_group_id: very_gentle_subgroup.id, day: "samedi")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T11:00:00.000Z", end_time: "2023-10-14T12:30:00.000Z")

[pregnant_women_subgroup, very_gentle_subgroup, intermediate_subgroup].each do |subgroup|
  Tarification.create(
    amount: 19,
    recurrence: "cours",
  )
  Tarification.create(
    amount: 158,
    recurrence: "10 cours",
  )
  Tarification.create(
    amount: 63,
    recurrence: "semaine illimitée",
  )
  Tarification.create(
    amount: 158,
    recurrence: "mois illimité",
  )
  Tarification.create(
    amount: 410,
    recurrence: "3 mois illimités",
  )
  Tarification.create(
    amount: 1208,
    recurrence: "an illimité",
  )
end

beginner_trial_subgroup = SubGroup.create(
  activity_id: yoga.id,
  name: "Cours d'essai pour débutants",
  min_price_cents: 0000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours gratuit pour découvrir le yoga dans une ambiance chaleureuse.",
  subscription_by_recurrence_price_cents: 0,
)
Tarification.create(
  amount: 0,
  recurrence: "cours d'essai",
  sub_group: beginner_trial_subgroup
)

# gentle_subgroup = SubGroup.create(
#   activity_id: yoga.id,
#   name: "Pratique Douce",
#   min_price_cents: 1900,
#   max_price_cents: nil,
#   recurrence: nil,
#   class_type: "Cours collectif",
#   short_description: "Cours pour intermédiaires. Approfondissez votre pratique du Yoga dans une ambiance chaleureuse.",
#   subscription_by_recurrence_price_cents: 0,
#   tarifications: ["19/cours", "158/10 cours", "63/semaine illimitée", "158/mois illimité", "410/3 mois illimités", "1208/an illimité"],
# )

# advanced_subgroup = SubGroup.create(
#   activity_id: yoga.id,
#   name: "Pratique Avancée",
#   min_price_cents: 1900,
#   max_price_cents: nil,
#   recurrence: nil,
#   class_type: "Cours collectif",
#   short_description: "Cours pour intermédiaires. Approfondissez votre pratique du Yoga dans une ambiance chaleureuse.",
#   subscription_by_recurrence_price_cents: 0,
#   tarifications: ["19/cours", "158/10 cours", "63/semaine illimitée", "158/mois illimité", "410/3 mois illimités", "1208/an illimité"],
# )

# integral_subgroup = SubGroup.create(
#   activity_id: yoga.id,
#   name: "Pratique Intégrale",
#   min_price_cents: 1900,
#   max_price_cents: nil,
#   recurrence: nil,
#   class_type: "Cours collectif",
#   short_description: "Cours pour intermédiaires. Approfondissez votre pratique du Yoga dans une ambiance chaleureuse.",
#   subscription_by_recurrence_price_cents: 0,
#   tarifications: ["19/cours", "158/10 cours", "63/semaine illimitée", "158/mois illimité", "410/3 mois illimités", "1208/an illimité"],
# )

# theme_class_subgroup = SubGroup.create(
#   activity_id: yoga.id,
#   name: "Cours a Theme",
#   min_price_cents: 1900,
#   max_price_cents: nil,
#   recurrence: nil,
#   class_type: "Cours collectif",
#   short_description: "Cours pour intermédiaires. Approfondissez votre pratique du Yoga dans une ambiance chaleureuse.",
#   subscription_by_recurrence_price_cents: 0,
#   tarifications: ["19/cours", "158/10 cours", "63/semaine illimitée", "158/mois illimité", "410/3 mois illimités", "1208/an illimité"],
# )
