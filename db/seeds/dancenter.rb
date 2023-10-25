etienne2 = User.create!(
  email: 'etiennededianous+2@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "480ab15b-01f0-41c8-b344-f803614fea9c"
)
dancenter = Club.create(
  name: "Dancenter",
  geo_point: "48.8825359, 2.3155488",
  objet: "Le Dancenter Paris, école de danse dans le 17e arrondissement, vous propose des cours de danse en solo ou en couple: salsa, rock, zumba, tango, lindy hop, bachata, valse... mais aussi des soirées et des stages",
  category_number: "11000",
  subcategory_number: "11045",
  category: "Sports, activités de plein air",
  subcategory: "Danse sportive (danse sportive, hip hop, claquettes)",
  address: "6 impasse de Lévis",
  actual_zipcode: "75017",
  user: etienne2,
  structure_type: 1,
  images: ["salsa.jpeg"]
)

salsa = Activity.create(
  name: "Salsa",
  geo_point: "48.8825359, 2.3155488",
  category_number: "11000",
  subcategory_number: "11045",
  category: "Sports, activités de plein air",
  subcategories: "Danse sportive (danse sportive, hip hop, claquettes)",
  address: "6 impasse de Lévis",
  actual_zipcode: "75017",
  full_description: "Cours de différents niveaux de salsa du lundi au samedi. Les cours sont maintenus à partir de 6 personnes. Les changements de niveau se font avec l'accord du professeur. Les cours durent 55 minutes.",
  free_trial: true,
  short_description: "Apprenez la salsa dans une ambiance chaleureuse",
  is_looking_for_volunteer: false,
  images: ["salsa.jpeg"]
  club_id: dancenter.id
)

rock = Activity.create(
  name: "Rock",
  geo_point: "48.8825359, 2.3155488",
  category_number: "11000",
  subcategory_number: "11045",
  category: "Sports, activités de plein air",
  subcategories: "Danse sportive (danse sportive, hip hop, claquettes)",
  address: "6 impasse de Lévis",
  actual_zipcode: "75017",
  full_description: "Cours de différents niveaux de rock du lundi au samedi. Les cours sont maintenus à partir de 6 personnes. Les changements de niveau se font avec l'accord du professeur. Les cours durent 55 minutes.",
  free_trial: true,
  short_description: "Apprenez le rock dans une ambiance chaleureuse",
  is_looking_for_volunteer: false,
  images: ["salsa.jpeg"],
  club_id: dancenter.id
)

bachata = Activity.create(
  name: "Bachata",
  geo_point: "48.8825359, 2.3155488",
  category_number: "11000",
  subcategory_number: "11045",
  category: "Sports, activités de plein air",
  subcategories: "Danse sportive (danse sportive, hip hop, claquettes)",
  address: "6 impasse de Lévis",
  actual_zipcode: "75017",
  full_description: "Cours de différents niveaux de Bachata du lundi au samedi. Les cours sont maintenus à partir de 6 personnes. Les changements de niveau se font avec l'accord du professeur. Les cours durent 55 minutes.",
  free_trial: true,
  short_description: "Apprenez la Bachata dans une ambiance chaleureuse",
  is_looking_for_volunteer: false,
  images: ["salsa.jpeg"],
  club_id: dancenter.id
)

free_trial_subgroup = SubGroup.create(
  activity_id: salsa.id,
  name: "Cours d'essai",
  min_price_cents: 0,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours d'essai gratuit d'une demi heure (sous réserve qu'il y ait au moins 6 personnes inscrites).",
  tarifications: ["0/cours d'essai"]
)

a=Schedule.create(sub_group_id: free_trial_subgroup.id, day: "lundi")
b=Schedule.create(sub_group_id: free_trial_subgroup.id, day: "mardi")

TimeSlot.create(schedule_id: a.id, start_time: "2023-10-14T19:00:00.000Z", end_time: "2023-10-14T19:30:00.000Z")
TimeSlot.create(schedule_id: b.id, start_time: "2023-10-14T20:00:00.000Z", end_time: "2023-10-14T20:30:00.000Z")


initiation_subgroup = SubGroup.create(
  activity_id: salsa.id,
  name: "Initiation",
  min_price_cents: 30,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Cours d'initiation à la salsa pour ceux qui n'en ont jamais fait. Apprentissage des pas de base",
  tarifications: ["30/cours d'essai", "595/forfait annuel 1 cours/semaine", "1090/forfait annuel 2 cours/semaine", "1490/forfait annuel 3 cours/semaine", "380/20 cours", "695/40 cours + 1 stage + 1 training", "1200/80 cours + 1 stage + 1 training"]
)

a=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "lundi")
b=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "mardi")
f=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "samedi")
TimeSlot.create(schedule_id: a.id, start_time: "2023-10-14T19:30:00.000Z", end_time: "2023-10-14T20:25:00.000Z")
TimeSlot.create(schedule_id: b.id, start_time: "2023-10-14T20:30:00.000Z", end_time: "2023-10-14T21:25:00.000Z")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T15:00:00.000Z", end_time: "2023-10-14T15:55:00.000Z")




beginner_subgroup = SubGroup.create(
  activity_id: salsa.id,
  name: "Débutant",
  min_price_cents: 3000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Pour ceux qui ont passé le niveau initiation. Apprentissage d'autres pas de base et de figures simples.",
  tarifications: ["30/cours d'essai", "595/forfait annuel 1 cours/semaine", "1090/forfait annuel 2 cours/semaine", "1490/forfait annuel 3 cours/semaine", "380/20 cours", "695/40 cours + 1 stage + 1 training", "1200/80 cours + 1 stage + 1 training"]
)

b=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "mardi")
c=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "mercredi")
f=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "samedi")

TimeSlot.create(schedule_id: b.id, start_time: "2023-10-14T21:30:00.000Z", end_time: "2023-10-14T22:25:00.000Z")
TimeSlot.create(schedule_id: c.id, start_time: "2023-10-14T19:30:00.000Z", end_time: "2023-10-14T20:25:00.000Z")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T16:00:00.000Z", end_time: "2023-10-14T16:55:00.000Z")


intermediate = SubGroup.create(
  activity_id: salsa.id,
  name: "Intermédiaire",
  min_price_cents: 3000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Pour ceux qui ont passé le niveau débutant. Apprentissage des 15 pas intermédiaires. ",
  tarifications: ["30/cours d'essai", "595/forfait annuel 1 cours/semaine", "1090/forfait annuel 2 cours/semaine", "1490/forfait annuel 3 cours/semaine", "380/20 cours", "695/40 cours + 1 stage + 1 training", "1200/80 cours + 1 stage + 1 training"]
)

c=Schedule.create(sub_group_id: intermediate.id, day: "mercredi")
d=Schedule.create(sub_group_id: intermediate.id, day: "jeudi")
f=Schedule.create(sub_group_id: adult_debutant_subgroup.id, day: "samedi")

TimeSlot.create(schedule_id: c.id, start_time: "2023-10-14T21:30:00.000Z", end_time: "2023-10-14T22:25:00.000Z")
TimeSlot.create(schedule_id: d.id, start_time: "2023-10-14T19:30:00.000Z", end_time: "2023-10-14T20:25:00.000Z")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T17:00:00.000Z", end_time: "2023-10-14T17:55:00.000Z")

advanced = SubGroup.create(
  activity_id: salsa.id,
  name: "Avancé",
  min_price_cents: 3000,
  max_price_cents: nil,
  recurrence: nil,
  class_type: "Cours collectif",
  short_description: "Admission sur autorisation du professeur, avoir complêté les autres niveaux.",
  tarifications: ["30/cours d'essai", "595/forfait annuel 1 cours/semaine", "1090/forfait annuel 2 cours/semaine", "1490/forfait annuel 3 cours/semaine", "380/20 cours", "695/40 cours + 1 stage + 1 training", "1200/80 cours + 1 stage + 1 training"]
)
d=Schedule.create(sub_group_id: advanced.id, day: "jeudi")
f=Schedule.create(sub_group_id: advanced.id, day: "samedi")

TimeSlot.create(schedule_id: d.id, start_time: "2023-10-14T20:30:00.000Z", end_time: "2023-10-14T21:25:00.000Z")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T18:00:00.000Z", end_time: "2023-10-14T18:55:00.000Z")

soirees = SubGroup.create(
  activity_id: salsa.id,
  name: "Training-soirées"
  min_price_cents: 1000,
  class_type: "Soirée",
  short_description: "Ouvert à tous, sans réservation. 3 niveau de cours : Débutants de 19 à 19:45, Intermédiaire de 19:45 a 20:30, Avancé de 19:30 à 20:30. L'échauffement pour les avancés dès 19:15, mise en pratique dans 2 salles de 20:30 à 22:30."
  tarifications: ["10/soirée", "90/carte 10 soirées"]
)
f=Schedule.create(sub_group_id: soirees.id, day: "samedi")
TimeSlot.create(schedule_id: f.id, start_time: "2023-10-14T19:00:00.000Z", end_time: "2023-10-14T22:30:00.000Z")
