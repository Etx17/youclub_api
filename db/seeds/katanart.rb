Club.find_by(name: "KATAN'ART")&.destroy
User.find_by(email: 'youclubdev@gmail.com')&.destroy
# ASTRODOJO CLUB SEED : user, club
youclubdev = User.create!(
  email: 'youclubdev@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "0787a7d6-14fa-41de-94e2-7a8ead872675"
)

astrodojo = Club.create(
  name: "KATAN'ART",
  geo_point: "48.8856124, 2.3233836",
  objet: "Cours de différents arts martiaux dans une ambiance et une communauté soudée. Organisation de cercles de paroles et autres activités complémentaires.",
  category_number: "11000",
  subcategory_number: "11145",
  category: "Sports, activités de plein air",
  subcategory: "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  address: "19 rue Nollet",
  actual_zipcode: "75017",
  user: youclubdev,
  structure_type: 1,
  images: ["judo.jpeg"],
  phone_number: "0145224523",
  website: "https://www.katan-art.com/",
  adherence_fee: 30,
  is_premium: true,
)

judo_jujitsu = Activity.create(
  name: "Judo - Jujitsu",
  geo_point: "48.8856124, 2.3233836",
  category: "Sports, activités de plein air",
  address: "19 rue Nollet",
  actual_zipcode: "75017",
  free_trial: true,
  is_looking_for_volunteer: nil,
  subcategories: "Judo",
  recurrence: nil,
  subscription_link: nil,
  short_description: "'Meilleur club d'arts martiaux de Paris' - Le Figaro",
  full_description: "Judo pour tous âges et tous niveaux, plusieurs créneaux dans la semaine en fonction des niveaux de chacun.\n\nInscription annuelle pour un cours par semaine. Pour ajouter avoir un deuxième cours dans la semaine, ajouter 200e au prix initial.",
  club_id: astrodojo.id,
)

child_subgroup = SubGroup.create(
  activity_id: judo_jujitsu.id,
  name: "Enfants ( 4 - 6ans)",
  min_price_cents: 48000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Mélange de judo et de jujitsu. Pour un deuxième cours par semaine, ajouter 200e/an.\n+ abonnement vidéo pédagogiques: 20e/mois",
  subscription_by_recurrence_price_cents: 0,
  tarifications: ["480/An"],
)

a = Schedule.create(sub_group_id: child_subgroup.id, day: "mercredi", )
b = Schedule.create(sub_group_id: child_subgroup.id, day: "mercredi", )
c = Schedule.create(sub_group_id: child_subgroup.id, day: "mercredi", )

TimeSlot.create( schedule_id: a.id, start_time: "2023-10-14T12:00:00.000Z", end_time: "2023-10-14T13:00:00.000Z")
TimeSlot.create( schedule_id: a.id, start_time: "2023-10-14T09:00:00.000Z", end_time: "2023-10-14T10:00:00.000Z")
TimeSlot.create( schedule_id: b.id, start_time: "2023-10-14T15:00:00.000Z", end_time: "2023-10-14T16:00:00.000Z")
TimeSlot.create( schedule_id: c.id, start_time: "2023-10-14T08:00:00.000Z", end_time: "2023-10-14T09:00:00.000Z")


teen_subgroup = SubGroup.create(
  activity_id: judo_jujitsu.id,
  name: "Ados (13-16 ans)",
  min_price_cents: 48000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Groupe pandas le mardi, salamandres le mercredi et scarabées le jeudi. En fonction des places disponibles",
  subscription_by_recurrence_price_cents: 0,
  tarifications: ["480/An"],
)

a = Schedule.create(sub_group_id: teen_subgroup.id, day: "mardi")
b = Schedule.create(sub_group_id: teen_subgroup.id, day: "mercredi")
c = Schedule.create(sub_group_id: teen_subgroup.id, day: "jeudi")

TimeSlot.create( schedule_id: a.id, start_time: "2023-10-15T16:00:00.000Z", end_time: "2023-10-15T17:00:00.000Z")
TimeSlot.create( schedule_id: b.id, start_time: "2023-10-15T16:00:00.000Z", end_time: "2023-10-15T17:00:00.000Z")
TimeSlot.create( schedule_id: c.id, start_time: "2023-10-15T17:00:00.000Z", end_time: "2023-10-15T18:00:00.000Z")


adult_subgroup = SubGroup.create(
  activity_id: judo_jujitsu.id,
  name: "Adultes (16+)",
  min_price_cents: 48000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectifs",
  short_description: "Le jujitsu aborde à la fois le karaté, le judo et le combat au sol. Tous les cours incluent de la méditation, du QI gong et des techniques de développement personnel et relationnel permettant l’exploration de soi à travers la progression martiale",
  subscription_by_recurrence_price_cents: 0,
  tarifications: ["480/An"]
)


a = Schedule.create(sub_group_id: adult_subgroup.id, day: "mardi")
b = Schedule.create(sub_group_id: adult_subgroup.id, day: "mercredi")
c = Schedule.create(sub_group_id: adult_subgroup.id, day: "jeudi")

TimeSlot.create( schedule_id: a.id, start_time: "2023-10-15T18:00:00.000Z", end_time: "2023-10-15T19:30:00.000Z")
TimeSlot.create( schedule_id: b.id, start_time: "2023-10-15T18:00:00.000Z", end_time: "2023-10-15T19:30:00.000Z")
TimeSlot.create( schedule_id: c.id, start_time: "2023-10-15T18:00:00.000Z", end_time: "2023-10-15T19:30:00.000Z")
