# ATTENTION: télécharger d'abord l'export JSON sur data.gouv, puis le ranger dans seeds. Il devrait s'appeller jo_associations.json
# On ne le push pas sur github car ca ne sert a rien et c'est très volumineux
require 'json/streamer'
parser = Json::Streamer.parser(file_io: File.open('./db/seeds/jo_associations.json', 'r'))
parser.get(nesting_level: 1) do |object|
    category = object["domaine_activite_libelle_categorise"]
    next if category.length > 1
    next if category[0].split('/')[0] != "culture, pratiques d’activités artistiques, culturelles"
    next if category[0].split('/')[1].blank?
    next if object["titre"].blank?
    next if object["geo_point"].blank?
    next if object["objet"].blank?

    subcategories = object["domaine_activite_libelle_categorise"][0].split("/").drop(1).map{|x| x.chomp("/").capitalize}

    p "creating club..."
    user = User.create!(
      email: Faker::Internet.email,
      password: 'my_encrypted_password',
      role: 'club',
    )

    Club.create(
      user: user,
      category: "Culture, pratiques d’activités artistiques, culturelles",
      name: object['titre'],
      rna_number: object['numero_rna'],
      geo_point: "#{object['geo_point']["lat"]}, #{object['geo_point']["lon"]}",
      subcategories: subcategories,
      structure_type: 0,
      address: object['adresse_actuelle'],
      actual_zipcode: object['codepostal_actuel'],
      website: object['siteweb'],
      objet: object['objet'].capitalize,
      city: object['commune_actuelle']
    )
end
