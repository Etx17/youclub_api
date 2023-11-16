# Table name: clubs
#  id                 :bigint           not null, primary key
#  name               :string
#  rna_number         :string
#  geo_point          :string
#  category           :string
#  address            :string
#  actual_zipcode     :string
#  subcategory        :string
#  nearbyStation      :string
#  website            :string
#  objet              :text
#  user_id            :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  images             :string           default([]), is an Array
#  category_number    :string
#  subcategories_number :array
#  structure_type     :integer
#  phone_number       :string
#  adherence_fee      :integer
#  is_premium         :boolean          default(FALSE)
#
class Club < ApplicationRecord
  belongs_to :user, optional: true
  has_one :claim, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many_attached :photos
  enum structure_type: {
    association: 0,
    club: 1,
  }
  has_many :comments, dependent: :destroy
  after_update :calculate_score

  def calculate_score
    new_score = 0

    # Critères de calcul
    new_score += 10000 if is_premium
    new_score += comments.count * 10
    new_score += photos.count * 50 # Remplacer 'photos' par la relation appropriée
    new_score += 10 unless activities.empty?

    activities.first do |activity|
      new_score += 50 if activity.description.present?
      new_score += 50 if activity.sub_groups.any?
      new_score += 50 if activity.sub_groups.first.schedules.any?
    end

    # Mettre à jour le score
    update_column(:score, new_score)
  end

  def distance_from(user_coords_string)
    # user_coords_string = "48.8566,2.3522"
    latitude = user_coords_string.split(',')[0].to_f
    longitude = user_coords_string.split(',')[1].to_f

    club_latitude = self.geo_point.split(', ')[0].to_f
    club_longitude = self.geo_point.split(', ')[1].to_f

    # convert degrees to radians
    def to_radians(degrees)
      degrees * Math::PI / 180
    end

    # calculate distance between two points on the earth using the Haversine formula
    def haversine(lat1, lon1, lat2, lon2)
      earth_radius_km = 6371

      dlat = to_radians(lat2 - lat1)
      dlon = to_radians(lon2 - lon1)

      a = Math.sin(dlat / 2) * Math.sin(dlat / 2) +
          Math.cos(to_radians(lat1)) * Math.cos(to_radians(lat2)) *
          Math.sin(dlon / 2) * Math.sin(dlon / 2)

      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      distance = earth_radius_km * c
    end

    haversine(club_latitude, club_longitude, latitude, longitude)
  end

  def category_images
    {
      "Sports, activités de plein air": {
          "Non catégorisé": ["olympics", "sport", "exercise"],
          "Badminton (badminton, squash, pelote basque)": ["shuttlecock", "badminton"],
          "Sports mécaniques (sport automobile, moto, trial)": ["driving", "car", "circuit"],
          "Football (football, futsal)": ["soccer", "football", "futsal", "balloon"],
          "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic": ["gymnastics", "fitness", "yoga"],
          "Autres arts martiaux (karaté, aïkido, taekwondo)": ["judo", "karate", "taekwondo"],
          "Equitation (équitation, hippisme, course camarguaise, landaise)": ["horse", "riding", "equestrian"],
          "Associations multisports locales": ["sports", "community", "club"],
          "Sports de combat (boxe, kick box, boxe thaï, lutte)": ["boxing", "kickboxing", "wrestling"],
          "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)": ["cycling", "biking", "mountain"],
          "Marche sportive (randonnée pédestre, raid, trekking, course orientation)": ["hiking", "trekking", "trail"],
          "Boules (pétanque, boules)": ["boules", "petanque", "bocce"],
          "Associations pour la promotion du sport, médailles, mérite sportif": ["Podium", "Champion", "winner"],
          "Activités de plein air (dont saut à l’élastique)": ["outdoor", "adventure", "extreme"],
          "Tir (tir à l’arc, tir à balle, ball trap), javelot": ["archery", "shooting", "javelin"],
          "Associations multisports scolaires ou universitaires": ["school", "college", "university"],
          "Rugby (rugby à 13, à 15)": ["rugby", "football", "melee"],
          "Danse sportive (danse sportive, hip hop, claquettes)": ["dancing", "hip hop", "tap"],
          "Tennis (tennis, longue paume)": ["tennis", "racquet", "court"],
          "Athlétisme (triathlon, pentathlon, footing, jogging)": ["athletics", "jump", "footing"],
          "Gestion d'équipements sportifs, organisation de rencontres sportives, organisation de championnats, clubs de supporters": ["stadium", "management", "supporters"],
          "Basket-ball": ["basketball", "hoops", "court"],
          "Nautisme, glisse sur eau (ski nautique, surf, char à voile)": ["sailing", "water", "surfing"],
          "Voile (voile, dériveur, planche à voile)": ["sailing", "sailboat", "windsurfing"],
          "Natation - baignade (natation, plongée)": ["swimming", "diving", "pool"],
          "Judo": ["judo", "martial", "defense"],
          "Sports de neige (ski alpin, ski de fond, snowboard), montagne": ["skiing", "snowboarding", "mountains"],
          "Handball": ["handball", "team", "indoor"],
          "Handisport": ["disability", "wheelchair", "inclusivity"],
          "Roller, skate": ["skateboard", "rollerblade", "derby"],
          "Tennis de table (tennis de table, ping-pong)": ["tennis", "ping", "paddle"],
          "Golf": ["golf", "putting", "driving range"],
          "Associations multisports d'entreprise": ["corporate", "sports", "company"],
          "Volley ball (volley, beach volley)": ["volleyball", "beach volleyball", "spike"],
          "Autres sports collectifs (baseball, hockey sur glace, football américain)": ["team", "baseball", "hockey"],
          "Escalade, montagne (escalade, spéléologie, via ferrata, canyonisme, alpinisme)": ["climbing", "mountain", "canyon"],
          "Sports aériens (avion, planeur, ULM, parachutisme)": ["parachute", "boeing", "aircraft"],
          "Musculation (culturisme, musculation)": ["bodybuilding", "weightlifting", "fitness"],
          "Aviron, canoë kayak (aviron, rafting, canoë kayak, joutes)": ["rowing", "canoeing", "rafting"],
          "Escrime": ["fencing", "sword", "foil"],
          "Hockey sur glace, sports de glace": ["hockey", "skating", "ice"],
          "Haltérophilie": ["weightlifting", "powerlifting", "strength"],
          "Non catégorisé": ["nature", "sport", "fun"]
      },
      "Culture, pratiques d’activités artistiques, culturelles": {
          "Chant choral, musique": ["choir", "music", "performance"],
          "Promotion de l’art et des artistes": ["promotion", "art", "artist"],
          "Théâtre, marionnettes, cirque, spectacles de variété": ["theater", "puppetry", "circus"],
          "Danse": ["dance", "salsa", "ballet"],
          "Loisirs scientifiques et techniques": ["science", "technology", "hobby"],
          "Artisanat, travaux manuels, bricolage, expositions": ["crafts", "handiwork", "exhibitions"],
          "Photographie, cinéma (dont ciné-clubs)": ["photography", "cinema", "film clubs"],
          "Expression écrite, littérature, poésie": ["literature", "writing", "poetry"],
          "Arts graphiques, bande dessinée, peinture, sculpture, architecture": ["art", "graphics", "sculpture"],
          "Folklore": ["folklore", "tradition", "heritage"],
          "Langues, dialectes, patois": ["language", "dialects", "vernacular"],
          "Bibliothèques, ludothèques, discothèques, vidéothèques": ["library", "games", "media"],
          "Arts de la rue": ["artist", "juggler", "performance"]
      }
    }
  end

  def default_image_keyword
    category_images[self.category&.to_sym][self.subcategories&.first&.to_sym]&.sample || "sports"
  end
end
