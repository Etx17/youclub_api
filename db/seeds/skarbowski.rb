Club.find_by(name: "Skarbowski")&.destroy
User.find_by(email: 'etiennededianous+1@gmail.com')&.destroy

etienne1 = User.create!(
  email: 'etiennededianous+1@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "3d871b5a-3826-4009-8b5e-f29941d1e363"
)

skarbowski = Club.create(
  name: "Skarbowski",
  rna_number: nil,
  geo_point: "48.8911534, 2.328426",
  category: "Sports, activités de plein air",
  address: "135 rue Lamarck",
  actual_zipcode: "75018",
  subcategory: "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  nearbyStation: nil,
  website: nil,
  objet: "Boxe Thailandaise enseignée par le champion du monde de la discipline. Cours pour tous les niveaux tous les jours",
  user: etienne1,
  images: [],
  category_number: "11000",
  subcategory_number: "11150",
  structure_type: "club"
)

muay_thai = Activity.create(
  name: "Muay Thai",
  geo_point: "48.8911534, 2.328426",
  category: "Sports, activités de plein air",
  address: "135 rue Lamarck",
  actual_zipcode: "75018",
  free_trial: false,
  is_looking_for_volunteer: nil,
  subcategories: "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  recurrence: nil,
  subscription_link: nil,
  short_description: "TO DO remove work in progress",
  full_description: "Cours dispensés par des professeurs formés par le champion de la discipline. Entraînement libre tout au long de la journée dans la salle. 30 euros de frais d'inscriptions pour tout nouvel adhérent.",
  club_id: skarbowski.id,
)

adult_debutant_subgroup = SubGroup.create(
  activity_id: muay_thai.id,
  name: "Adulte débutant",
  min_price_cents: 2000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours pour adultes débutants. Apprenez les bases du Muay Thai dans une ambiance chaleureuse.",
  subscription_by_recurrence_price_cents: 0,
  tarifications: ["20/jour", "84/mois", "180/trimestre", "312/semestre", "495/an"],
)

a=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "lundi")
b=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "mardi")
c=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "mercredi")
d=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "jeudi")
e=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "vendredi")
f=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "samedi")
g=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "dimanche")

[ a, b, c, d, e ].each do |schedule|
  TimeSlot.create(schedule_id: schedule.id, start_time: "2023-10-14T12:30:00.000Z", end_time: "2023-10-14T13:30:00.000Z")
  TimeSlot.create(schedule_id: schedule.id, start_time: "2023-10-14T17:00:00.000Z", end_time: "2023-10-14T18:00:00.000Z")
  TimeSlot.create(schedule_id: schedule.id, start_time: "2023-10-14T19:30:00.000Z", end_time: "2023-10-14T20:30:00.000Z")
end

TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T11:00:00.000Z", end_time: "2023-10-14T12:00:00.000Z")
TimeSlot.create(schedule_id: g.id, start_time: "2023-10-14T11:00:00.000Z", end_time: "2023-10-14T12:00:00.000Z")


adult_tous_niveaux_subgroup = SubGroup.create(
  activity_id: muay_thai.id,
  name: "Adulte Tous Niveaux",
  min_price_cents: 2000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours pour adultes tous niveaux. Apprenez les bases du Muay Thai dans une ambiance chaleureuse.",
  subscription_by_recurrence_price_cents: 0,
  tarifications: ["20/jour", "84/mois", "180/trimestre", "312/semestre", "495/an"],
)

a=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "lundi")
b=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "mardi")
c=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "mercredi")
d=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "jeudi")
e=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "vendredi")
f=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "samedi")
g=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "dimanche")

[ a, b, c, d, e ].each do |schedule|
  TimeSlot.create(schedule_id: schedule.id, start_time: "2023-10-14T10:30:00.000Z", end_time: "2023-10-14T12:00:00.000Z")
  TimeSlot.create(schedule_id: schedule.id, start_time: "2023-10-14T15:00:00.000Z", end_time: "2023-10-14T16:30:00.000Z")
  TimeSlot.create(schedule_id: schedule.id, start_time: "2023-10-14T18:00:00.000Z", end_time: "2023-10-14T19:30:00.000Z")
  TimeSlot.create(schedule_id: schedule.id, start_time: "2023-10-14T20:30:00.000Z", end_time: "2023-10-14T21:30:00.000Z")
end

TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T15:00:00.000Z", end_time: "2023-10-14T17:00:00.000Z")
TimeSlot.create(schedule_id: g.id, start_time: "2023-10-14T14:00:00.000Z", end_time: "2023-10-14T15:30:00.000Z")



enfants_minus_8_subgroup = SubGroup.create(
  activity_id: muay_thai.id,
  name: "Enfants (-8 ans)",
  min_price_cents: 1100,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours pour enfants de moins de 8 ans. Apprenez les bases du Muay Thai dans une ambiance chaleureuse.",
  subscription_by_recurrence_price_cents: 0,
  tarifications: ["110/trimestre", "300/an"],
)
e=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "mercredi")
f=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "samedi")
TimeSlot.create(schedule_id: e.id, start_time: "2023-10-14T13:00:00.000Z", end_time: "2023-10-14T14:00:00.000Z")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T13:00:00.000Z", end_time: "2023-10-14T14:00:00.000Z")

enfants_12_subgroup = SubGroup.create(
  activity_id: muay_thai.id,
  name: "Enfants (8-12 ans)",
  min_price_cents: 1100,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours pour enfants",
  subscription_by_recurrence_price_cents: 0,
  tarifications: ["110/trimestre", "300/an"],
)

d=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "mercredi")
e=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "vendredi")
f=Schedule.create(sub_group_id: adult_tous_niveaux_subgroup.id, day: "samedi")

TimeSlot.create(schedule_id: d.id, start_time: "2023-10-14T14:00:00.000Z", end_time: "2023-10-14T15:00:00.000Z")
TimeSlot.create(schedule_id: e.id, start_time: "2023-10-14T18:00:00.000Z", end_time: "2023-10-14T19:00:00.000Z")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T14:00:00.000Z", end_time: "2023-10-14T15:00:00.000Z")
