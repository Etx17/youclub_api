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
      subcategory: "Non categorisé",
      subcategory_number: "0",
      structure_type: 1,
      objet: "#{result["nom"]} vous propose: #{result["activites"].join(", ")}"
    )

    result["activites"].each do |activity_name|
      Activity.create(
        name: activity_name,
        geo_point: result["geoloc_finale"]["lat"].to_s + ", " + result["geoloc_finale"]["lon"].to_s,
        category_number: "11000",
        category: "Sports, activités de plein air",
        subcategories: "Non categorisé",
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

  p "done !"
end
