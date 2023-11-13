p "Starting seeding assos du pass sport à paris"
limit = 100
(1..20).each do |number|
  arr = number == 1 ? "#{number}er" : "#{number}e"
  p "getting to url with #{arr} as arrondissement..."
  encoded_url = "https://sports-sgsocialgouv.opendatasoft.com/api/explore/v2.1/catalog/datasets/passsports-asso_volontaires/records?limit=#{limit}&refine=epci_name%3A%22M%C3%A9tropole%20du%20Grand%20Paris%22&refine=reg_name%3A%22%C3%8Ele-de-France%22&refine=com_arm_name%3A%22Paris%20#{arr}%20Arrondissement%22"

  conn = Faraday.new(url: encoded_url)

  response = conn.get

  items = JSON.parse(response.body)

  results = items["results"]

  p "Removing results without email, and their 'autres' activities, and those without activities..."
  filtered_results = results
    .filter { |result| result["courriel"].present? }
    .map do |result|
      activities = result["activites"]&.reject { |activity| activity&.include?("Autres") }
      result.merge("activites" => activities)
    end
    .reject { |result| result["activites"].blank? }

  p "Creating users, clubs, activities..."
  filtered_results.each do |result|
    next if result["courriel"].blank?
    user = User.create(
      email: result["courriel"],
      password: "123456",
      password_confirmation: "123456",
      role: "club"
    )
    p "user created successfully #{user.email}"

    next if user.nil? || user&.id.nil?
    club = Club.create(
      name: result["nom"],
      address: result["adresse"],
      actual_zipcode: result["cp"],
      phone_number: result["telephone"],
      website: result["site_web"],
      user: user,
      geo_point: result["geoloc_finale"]["lat"].to_s + ", " + result["geoloc_finale"]["lon"].to_s,
      category_number: "11000",
      category: "Sports, activités de plein air",
      subcategories: ["Non catégorisé"],
      subcategories_number: ["0"],
      structure_type: 1,
      objet: "#{result["nom"]} vous propose: #{result["activites"].join(", ")}"
    )

    result["activites"].each do |activity_name|
      Activity.create(
        name: activity_name,
        geo_point: result["geoloc_finale"]["lat"].to_s + ", " + result["geoloc_finale"]["lon"].to_s,
        category_number: "11000",
        category: "Sports, activités de plein air",
        subcategories: ["Non catégorisé"],
        phone_number: result["telephone"],
        subcategory_number: "0",
        address: result["adresse"],
        actual_zipcode: result["cp"],
        full_description: " Venez pratiquer le/la #{activity_name} chez nous!",
        free_trial: false,
        short_description: "Venez pratiquer le/la #{activity_name} chez nous!",
        club: club,
      )
    end
  end

  p "done seeding club!"


end

subcategory_mapping = {
  "Aïkido" => "Autres arts martiaux (karaté, aïkido, taekwondo)",
  "Arts énergétiques et martiaux chinois" => "Autres arts martiaux (karaté, aïkido, taekwondo)",
  "Athlétisme" => "Athlétisme (triathlon, pentathlon, footing, jogging)",
  "Badminton" => "Badminton (badminton, squash, pelote basque)",
  "Baseball /Softball" => "Autres sports collectifs (baseball, hockey sur glace, football américain)",
  "Basketball" => "Basket-ball",
  "BMX" => "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)",
  "Bowling et sports de quilles" => "Non catégorisé",
  "Boxe" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Canoë-Kayak" => "Aviron, canoë kayak (aviron, rafting, canoë kayak, joutes)",
  "Cross training" => "Non catégorisé",
  "Cyclisme sur piste" => "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)",
  "Cyclisme sur route" => "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)",
  "Danse" => "Danse sportive (danse sportive, hip hop, claquettes)",
  "Double Dutch" => "Non catégorisé",
  "Echecs" => "Non catégorisé",
  "Equitation" => "Equitation (équitation, hippisme, course camarguaise, landaise)",
  "Escrime" => "Escrime",
  "Escalade" => "Escalade, montagne (escalade, spéléologie, via ferrata, canyonisme, alpinisme)",
  "Football" => "Football (football, futsal)",
  "Football américain / Flag" => "Autres sports collectifs (baseball, hockey sur glace, football américain)",
  "Force athlétique" => "Non catégorisé",
  "Futsal" => "Football (football, futsal)",
  "Golf" => "Golf",
  "Grappling" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Gymnastique artistique / rythmique" => "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic",
  "Gymnastique : disciplines acrobatiques" => "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic",
  "Haltérophilie" => "Haltérophilie",
  "Handball" => "Handball",
  "Handisport" => "Handisport",
  "Judo - Jujitsu" => "Judo",
  "Judo jujitsu" => "Judo",
  "Karaté" => "Autres arts martiaux (karaté, aïkido, taekwondo)",
  "Kickboxing" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Krav-Maga" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Lutte" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Marche nordique" => "Marche sportive (randonnée pédestre, raid, trekking, course orientation)",
  "Méditation" => "Non catégorisé",
  "Musculation" => "Musculation (culturisme, musculation)",
  "Muay Thai" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Natation" => "Natation - baignade (natation, plongée)",
  "Natation synchronisée" => "Natation - baignade (natation, plongée)",
  "Nage avec palmes" => "Natation - baignade (natation, plongée)",
  "Parachutisme" => "Sports aériens (avion, planeur, ULM, parachutisme)",
  "Parkour" => "Non catégorisé",
  "Pétanque et jeu provencal" => "Boules (pétanque, boules)",
  "Plongée" => "Natation - baignade (natation, plongée)",
  "Plongeon" => "Natation - baignade (natation, plongée)",
  "Randonnée pédestre" => "Marche sportive (randonnée pédestre, raid, trekking, course orientation)",
  "Roller & Rink Hockey" => "Roller, skate",
  "Roller artistique" => "Roller, skate",
  "Roller de vitesse" => "Roller, skate",
  "Rugby" => "Rugby (rugby à 13, à 15)",
  "Rock" => "Danse sportive (danse sportive, hip hop, claquettes)",
  "Salsa" => "Danse sportive (danse sportive, hip hop, claquettes)",
  "Rugby à XIII" => "Rugby (rugby à 13, à 15)",
  "Sambo" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Sauvetage" => "Non catégorisé",
  "Savate Boxe française" => "Sports de combat (boxe, kick box, boxe thaï, lutte)",
  "Skateboard et freestyle" => "Roller, skate",
  "Ski alpin" => "Sports de neige (ski alpin, ski de fond, snowboard), montagne",
  "Ski nordique / biathlon" => "Sports de neige (ski alpin, ski de fond, snowboard), montagne",
  "Surf" => "Nautisme, glisse sur eau (ski nautique, surf, char à voile)",
  "Taekwondo" => "Autres arts martiaux (karaté, aïkido, taekwondo)",
  "Tennis" => "Tennis (tennis, longue paume)",
  "Tennis de table" => "Tennis de table (tennis de table, ping-pong)",
  "Tir à l'arc" => "Tir (tir à l’arc, tir à balle, ball trap), javelot",
  "Triathlon" => "Athlétisme (triathlon, pentathlon, footing, jogging)",
  "Twirling bâton" => "Non catégorisé",
  "Voile" => "Voile (voile, dériveur, planche à voile)",
  "Volley" => "Volley ball (volley, beach volley)",
  "Wushu" => "Autres arts martiaux (karaté, aïkido, taekwondo)",
  "Yoga" => "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic"
}
p "now assigning categories to a club depending on the mapping array"
Club.all.each do |club|
  subcategories = []
  club.activities.each do |activity|
    subcategories << subcategory_mapping[activity.name]
  end
  club.update(subcategories: subcategories.uniq.compact)
end
