# frozen_string_literal: true

# Seeds the database with pharmacy info from /lib/seeds/pharmacies.csv
# See documentation for schema

require 'csv'
raw_pharmacy_info = File.read(Rails.root.join('lib', 'seeds', 'pharmacies.csv'))

parsed_pharmacy_info = CSV.parse(raw_pharmacy_info, headers: true, encoding: 'UFT-8')

parsed_pharmacy_info.each do |pharmacy_info|
  Pharmacy.create(
    name: pharmacy_info['name'].strip,
    address: pharmacy_info['address'].strip,
    city: pharmacy_info['city'].strip,
    state: pharmacy_info['state'].strip,
    zip: pharmacy_info['zip'].strip,
    latitude: pharmacy_info['latitude'].strip,
    longitude: pharmacy_info['longitude'].strip
  )
end
