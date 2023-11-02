class Club < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  enum structure_type: {
    association: 0,
    club: 1,
  }

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

    haversine(club_latitude, club_longitude, latitude, longitude) + 'km'
  end
end
