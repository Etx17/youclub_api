file_path = Rails.root.join('db', 'seeds', 'passsports-asso_volontaires.json')
file_content = File.read(file_path)
results = JSON.parse(file_content)

# Refleterles résultatsde ma basede donnée
filtered_results = results
  .filter { |result| result["courriel"].present? }
  .map do |result|
    activities = result["activites"]&.reject { |activity| activity&.include?("Autres") }
    result.merge("activites" => activities)
  end
  .reject { |result| result["activites"].blank? }

  filtered_results.each do |result|
    club = Club.find_by(name: result["nom"])
    club.update(city: result["commune"]) if club.present?
  end
