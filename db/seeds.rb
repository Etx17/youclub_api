# # Clear existing records (optional)
Club.destroy_all
Activity.destroy_all
SubGroup.destroy_all
Schedule.destroy_all
TimeSlot.destroy_all
User.destroy_all


User.create!(
  email: 'etiennededianous@gmail.com',
  password: 'my_encrypted_password',
  role: 'user',
  sub_id: '24ddf6e7-9d4e-4339-9bf3-ea395e32b089'
)

User.create!(
  email: 'youclubdev@gmail.com',
  password: 'my_encrypted_password',
  role: 'club',
  sub_id: "0787a7d6-14fa-41de-94e2-7a8ead872675"
)

# clubs << Club.create(
#   name: "KATAN'ART",
#   rna_number: result["fields"]["numero_rna"],
#   geo_point: result["fields"]["geo_point"],
#   objet: result["fields"]["objet"],
#   category_number: result["fields"]["domaine_activite_categorise"].split("/")[0].chomp("/"),
#   subcategory_number: result["fields"]["domaine_activite_categorise"].split("/")[1].chomp("/"),
#   category: result["fields"]["domaine_activite_libelle_categorise"].split("/")[0].chomp("/"),
#   subcategory: result["fields"]["domaine_activite_libelle_categorise"].split("/")[1].chomp("/"),
#   address: result["fields"]["adresse_actuelle"],
#   actual_zipcode: result["fields"]["codepostal_actuel"],
#   user: user,
#   structure_type: 0,
# )

# TODO
# ASTRODOJO CLUB SEED : user, club, activity, sub_group, schedule, time_slot
# SKARBOWSKI CLUB SEED : user, club, activity, sub_group, schedule, time_slot
# SIVANANDA YOGA CLUB SEED : user, club, activity, sub_group, schedule, time_slot
# DANCENTER CLUB SEED : user, club, activity, sub_group, schedule, time_slot
# FITNESSPARK CLUB SEED : user, club, activity, sub_group, schedule, time_slot

p "Start seeding SPORTS CLUBS in Paris..."
encoded_url = "https://journal-officiel-datadila.opendatasoft.com/api/records/1.0/search/?dataset=jo_associations&q=&rows=8000&sort=dateparution&facet=lieu_declaration_facette&facet=domaine_activite_categorise&facet=domaine_activite_libelle_categorise&refine.domaine_activite_libelle_categorise=Sports%2C+activit%C3%A9s+de+plein+air&refine.localisation_facette=%C3%8Ele-de-France%2FParis&exclude.objet=%22%22&exclude.domaine_activite_libelle_categorise=%22%22&"
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
  .filter{|result| result["fields"]["objet"] && result["fields"]["objet"].length > 100}
  .filter{|result| result["fields"]["typeavis"] == "Création"}
  .filter{|result| result["fields"]["domaine_activite_categorise"].split("/")[1].present?}

filtered_results.each do |result|
  next if result["fields"]["titre"].blank?
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
    subcategory: result["fields"]["domaine_activite_libelle_categorise"].split("/")[1].chomp("/"),
    address: result["fields"]["adresse_actuelle"],
    actual_zipcode: result["fields"]["codepostal_actuel"],
    user: user,
    structure_type: 0,
  )
end
p "done!"


# Seed activities
# activities = []
# clubs.each do |club|
#   activities << Activity.create!(
#     name: Faker::Lorem.words(number: 2).join(' ').capitalize,
#     geo_point: club.geo_point,
#     category: club.category,
#     address: club.address,
#     actual_zipcode: club.actual_zipcode,
#     free_trial: Faker::Boolean.boolean,
#     is_looking_for_volunteer: Faker::Boolean.boolean,
#     subcategories: club.subcategory,
#     recurrence: Faker::Lorem.word,
#     subscription_link: "#{club.website}/subscribe",
#     short_description: Faker::Lorem.sentence,
#     full_description: Faker::Lorem.paragraph,
#     club: club
#   )
# end

# # Seed subgroups
# sub_groups = []
# activities.each do |activity|
#   sub_groups << SubGroup.create!(
#     activity: activity,
#     class_type: possibleTypeOfActivity.sample,
#     name: examplesOfSubGroupNames.sample,
#     min_price_cents: Faker::Commerce.price(range: 5.0..50.0),
#     max_price_cents: Faker::Commerce.price(range: 50.0..100.0),
#     recurrence: Faker::Lorem.word,
#     short_description: Faker::Lorem.sentence,
#     # subscription_by_reccurence_price_cents: Faker::Commerce.price(range: 30.0..100.0),
#     tarifications: [Faker::Commerce.price, Faker::Commerce.price, Faker::Commerce.price].map { |price| "#{price}/mois" }
#   )
# end

# # Seed schedules and time slots
# schedules = []
# sub_groups.each do |sub_group|
#   3.times do
#     schedule = Schedule.create!(
#       sub_group: sub_group,
#       day: ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"].sample
#     )
#     schedules << schedule

#     # Seed time slots for each schedule
#     5.times do
#       TimeSlot.create!(
#         schedule: schedule,
#         start_time: "8:00",
#         end_time: "10:00"
#       )
#     end
#   end
# end
