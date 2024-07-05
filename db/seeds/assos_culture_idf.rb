require 'json'
File.open('./db/seeds/jo_associations.json', 'r') do |f|
  data = JSON.parse(f.read)
  data.each_with_index do |row, i|
    category = row["domaine_activite_libelle_categorise"]
    next if category.length > 1 # on next si il y a trop de choses dedans
    next if category[0].split('/')[0] != "culture, pratiques d’activités artistiques, culturelles"
    next if category[0].split('/')[1].blank?
    next if row["titre"].blank?
    next if row["geo_point"].blank?
    next if row["objet"].blank?

    subcategories = row["domaine_activite_libelle_categorise"][0].split("/").drop(1).map{|x| x.chomp("/").capitalize}

    p "creating club..."
    user = User.create!(
      email: Faker::Internet.email,
      password: 'my_encrypted_password',
      role: 'club',
    )

    Club.create(
      user: user,
      category: "Culture, pratiques d’activités artistiques, culturelles",
      name: row['titre'],
      rna_number: row['numero_rna'],
      geo_point: "#{row['geo_point']["lat"]}, #{row['geo_point']["lon"]}",
      subcategories: subcategories,
      structure_type: 0,
      address: row['adresse_actuelle'],
      actual_zipcode: row['codepostal_actuel'],
      website: row['siteweb'],
      objet: row['objet'].capitalize,
      city: row['commune_actuelle']
    )
  end
end
