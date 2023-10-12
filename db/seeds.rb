# p 'Clearing existing records...'
# Club.destroy_all
# Activity.destroy_all
# SubGroup.destroy_all
# Schedule.destroy_all
# TimeSlot.destroy_all
User.destroy_all

p "Seeding real clubs sivananda, dancenter, skarbowski, astrodojo"
etienne = User.create!(
  email: 'etiennededianous@gmail.com',
  password: 'my_encrypted_password',
  role: 'user',
  sub_id: '24ddf6e7-9d4e-4339-9bf3-ea395e32b089'
)

youclubdev = User.create!(
  email: 'youclubdev@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "0787a7d6-14fa-41de-94e2-7a8ead872675"
)

etienne1 = User.create!(
  email: 'etiennededianous+1@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "3d871b5a-3826-4009-8b5e-f29941d1e363"
)

etienne2 = User.create!(
  email: 'etiennededianous+2@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "480ab15b-01f0-41c8-b344-f803614fea9c"
)

etienne3 = User.create!(
  email: 'etiennededianous+3@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "5a9d1655-b54d-4670-a5eb-e3e954c9ec4f"
)

# ASTRODOJO CLUB SEED : user, club, activity, sub_group, schedule, time_slot
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
)

# SKARBOWSKI CLUB SEED : user, club, activity, sub_group, schedule, time_slot

skarbowski = Club.create(
  name: "Skarbowski",
  geo_point: "48.8911534, 2.328426",
  objet: "Boxe Thailandaise enseignée par le champion du monde de la discipline. Cours pour tous les niveaux tous les jours",
  category_number: "11000",
  subcategory_number: "11150",
  category: "Sports, activités de plein air",
  subcategory: "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  address: "135 rue Lamarck",
  actual_zipcode: "75018",
  user: etienne1,
  structure_type: 1,
)

dancenter = Club.create(
  name: "Dancenter",
  geo_point: "48.8825359, 2.3155488",
  objet: "Le Dancenter Paris, école de danse dans le 17e arrondissement, vous propose des cours de danse : salsa, rock, zumba, tango, lindy hop, bachata, valse...",
  category_number: "11000",
  subcategory_number: "11045",
  category: "Sports, activités de plein air",
  subcategory: "Danse sportive (danse sportive, hip hop, claquettes)",
  address: "6 impasse de Lévis",
  actual_zipcode: "75017",
  user: etienne2,
  structure_type: 1,
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
)
p "Seeded real clubs sivananda, dancenter, skarbowski, astrodojo"


# number_of_clubs=9000
# p "Start seeding SPORTS CLUBS in Paris..."
# encoded_url = "https://journal-officiel-datadila.opendatasoft.com/api/records/1.0/search/?dataset=jo_associations&q=&rows=#{number_of_clubs}&sort=dateparution&facet=lieu_declaration_facette&facet=domaine_activite_categorise&facet=domaine_activite_libelle_categorise&refine.domaine_activite_libelle_categorise=Sports%2C+activit%C3%A9s+de+plein+air&refine.localisation_facette=%C3%8Ele-de-France%2FParis&exclude.objet=%22%22&exclude.domaine_activite_libelle_categorise=%22%22&"
# p "connecting with API..."
# conn = Faraday.new(url: encoded_url)
# p "getting the response ..."
# response = conn.get
# p 'parsing the response...'
# items = JSON.parse(response.body)
# p 'filtering the results...'
# results = items["records"]
# filtered_results = results
#   .filter{|result| result["fields"]["domaine_activite_categorise"].split("###").length == 1}
#   .filter{|result| result["fields"]["objet"] && result["fields"]["objet"].length > 50}
#   .filter{|result| result["fields"]["typeavis"] == "Création"}
#   .filter{|result| result["fields"]["domaine_activite_categorise"].split("/")[1].present?}

# filtered_results.each do |result|
#   next if result["fields"]["titre"].blank? || result["fields"]["geo_point"].blank?
#   p "creating club..."
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: 'my_encrypted_password',
#     role: 'club',
#   )

#   Club.create!(
#     name: result["fields"]["titre"].gsub(/\(.*?\)/, '').strip,
#     rna_number: result["fields"]["numero_rna"],
#     geo_point: result["fields"]["geo_point"],
#     objet: result["fields"]["objet"],
#     category_number: result["fields"]["domaine_activite_categorise"].split("/")[0].chomp("/"),
#     subcategory_number: result["fields"]["domaine_activite_categorise"].split("/")[1].chomp("/"),
#     category: result["fields"]["domaine_activite_libelle_categorise"].split("/")[0].chomp("/"),
#     subcategory: result["fields"]["domaine_activite_libelle_categorise"].split("/")[1].chomp("/").capitalize,
#     address: result["fields"]["adresse_actuelle"],
#     actual_zipcode: result["fields"]["codepostal_actuel"],
#     user: user,
#     structure_type: 0,
#   )
# end
p "done!"
