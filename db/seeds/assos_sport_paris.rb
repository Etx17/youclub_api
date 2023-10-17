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
