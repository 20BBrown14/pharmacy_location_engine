# frozen_string_literal: true

json.ignore_nil!
json.set! :nearestPharmacy do
  json.set! :name, @nearest_pharmacy.name
  json.set! :address, @nearest_pharmacy.address
  json.set! :city, @nearest_pharmacy.city
  json.set! :state, @nearest_pharmacy.state
  json.set! :zip, @nearest_pharmacy.zip
  json.set! :distance, @nearest_pharmacy.distance
end
