p 'Clearing existing records...'
Club.destroy_all
Activity.destroy_all
SubGroup.destroy_all
Schedule.destroy_all
TimeSlot.destroy_all
User.destroy_all

etienne = User.create!(
  email: 'etiennededianous@gmail.com',
  password: 'my_encrypted_password',
  role: 'user',
  sub_id: '24ddf6e7-9d4e-4339-9bf3-ea395e32b089'
)

etienne2 = User.create!(
  email: 'etiennededianous+2@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "480ab15b-01f0-41c8-b344-f803614fea9c"
)



# Executer les fichier dans ./seeds/astrodojo.rb
# SKARBOWSKI CLUB SEED : user, club


# DANCENTER CLUB SEED : user, club

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

# SIVANANDA CLUB SEED : user, club


p "Seeded real clubs sivananda, dancenter, skarbowski, astrodojo"



p "Start seeding SPORTS CLUBS in PARIS..."
encoded_url = "https://journal-officiel-datadila.opendatasoft.com/api/records/1.0/search/?dataset=jo_associations&q=&rows=9000&sort=dateparution&facet=lieu_declaration_facette&facet=domaine_activite_categorise&facet=domaine_activite_libelle_categorise&refine.domaine_activite_libelle_categorise=Sports%2C+activit%C3%A9s+de+plein+air&refine.localisation_facette=%C3%8Ele-de-France%2FParis&exclude.objet=%22%22&exclude.domaine_activite_libelle_categorise=%22%22&exclude.domaine_activite_categorise=11000%2F11160&exclude.domaine_activite_categorise=11000%2F11004&exclude.domaine_activite_categorise=11000%2F11015&exclude.domaine_activite_categorise=11000%2F11005&exclude.domaine_activite_categorise=11000%2F11190"
p "connecting with API..."
conn = Faraday.new(url: encoded_url)
p "getting the response ..."
response = conn.get
p 'parsing the response...'
items = JSON.parse(response.body)
p 'filtering the results...'
results = items["records"]
filtered_results = results
  .filter{|result| result["fields"]["domaine_activite_categorise"].split("###").length == 1}
  .filter{|result| result["fields"]["objet"] && result["fields"]["objet"].length > 30}
  .filter{|result| result["fields"]["typeavis"] == "Création"}
  .filter{|result| result["fields"]["domaine_activite_categorise"].split("/")[1].present?}

filtered_results.each do |result|
  next if result["fields"]["titre"].blank? || result["fields"]["geo_point"].blank?
  p "creating club..."
  user = User.create!(
    email: Faker::Internet.email,
    password: 'my_encrypted_password',
    role: 'club',
  )

  Club.create!(
    name: result["fields"]["titre"].gsub(/\(.*?\)/, '').strip,
    rna_number: result["fields"]["numero_rna"],
    geo_point: result["fields"]["geo_point"],
    objet: result["fields"]["objet"],
    category_number: result["fields"]["domaine_activite_categorise"].split("/")[0].chomp("/"),
    subcategory_number: result["fields"]["domaine_activite_categorise"].split("/")[1].chomp("/"),
    category: result["fields"]["domaine_activite_libelle_categorise"].split("/")[0].chomp("/"),
    subcategory: result["fields"]["domaine_activite_libelle_categorise"].split("/")[1].chomp("/").capitalize,
    address: result["fields"]["adresse_actuelle"],
    actual_zipcode: result["fields"]["codepostal_actuel"],
    user: user,
    structure_type: 0,
  )
end
p "done!"
