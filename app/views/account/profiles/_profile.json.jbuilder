json.extract! profile, :fullname, :phone_number, :address, :postcode, :city, :state, :country, :created_at, :updated_at
json.url profiles_url
json.user current_user, :callsign, :email, :created_at, :updated_at
