# p 'Clearing existing records...'
# Club.destroy_all
# Activity.destroy_all
# SubGroup.destroy_all
# Schedule.destroy_all
# TimeSlot.destroy_all
# User.destroy_all

# etienne = User.create!(
#   email: 'etiennededianous@gmail.com',
#   password: 'my_encrypted_password',
#   role: 'user',
#   sub_id: '24ddf6e7-9d4e-4339-9bf3-ea395e32b089'
# )

# p "seeding all parisian sports clubs from api datagouv "
# require_relative 'seeds/assos_sport_paris'

p "seeding sivananda"
require_relative 'seeds/sivananda'
# p "seeding katanart"
# require_relative 'seeds/katanart'
p "seeding skarbowski"
require_relative 'seeds/skarbowski'
p "seeding assos from pass sport paris"
require_relative 'seeds/assos_pass_sport_paris'
p "all good!"
