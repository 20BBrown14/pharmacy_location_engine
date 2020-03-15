# frozen_string_literal: true

# Public: Model for a pharmacy
class Pharmacy < ApplicationRecord
  # The earth's radius in KM. see https://nssdc.gsfc.nasa.gov/planetary/factsheet/earthfact.html
  EARTH_RADIUS = 6_378.137

  # Constant to convert KM to mi
  KM_TO_MI_CONVERSTION_CONSTANT = 0.62137

  # Public: Float distance this pharmacy is from user location in mi
  attr_accessor :distance

  # Public: Given a point determines closest pharmacy to that point
  #
  # latitude    - String latitude coord given in degrees
  # longitude   - String longitude coord given in degrees
  #
  # Returns the closest pharmacy
  def self.determine_nearest(latitude, longitude)
    closest_pharmacy = nil
    Pharmacy.all.each do |pharmacy|
      point_one = { 'latitude' => latitude.to_f, 'longitude' => longitude.to_f }
      point_two = { 'latitude' => pharmacy.latitude.to_f, 'longitude' => pharmacy.longitude.to_f }
      distance = calculate_distance(point_one, point_two)
      pharmacy.distance = distance * KM_TO_MI_CONVERSTION_CONSTANT
      closest_pharmacy = pharmacy if closest_pharmacy.nil? || closest_pharmacy.distance > pharmacy.distance
    end
    closest_pharmacy
  end

  # Private: Calculates distance between two lat/long points using haversine formula
  # see https://www.movable-type.co.uk/scripts/latlong.html
  #
  # point_one   - Hash of the first point's information
  #               - latitude String for the latitude point in degrees
  #               - longitude String for the longitude point in degrees
  # point_two   - Hash of the second point's information
  #               - latitude String for the latitude point in degrees
  #               - longitude String for the longitude point in degrees
  #
  # Returns the distance between the two points in KM
  # rubocop:disable Metrics/AbcSize
  private_class_method def self.calculate_distance(point_one, point_two)
    lat_delta = to_rad(point_two['latitude'] - point_one['latitude'])
    long_delta = to_rad(point_two['longitude'] - point_one['longitude'])

    a = Math.sin(lat_delta / 2) * Math.sin(lat_delta / 2) +
        Math.cos(to_rad(point_one['latitude'])) * Math.cos(to_rad(point_two['latitude'])) *
        Math.sin(long_delta / 2) * Math.sin(long_delta / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    EARTH_RADIUS * c
  end
  # rubocop:enable Metrics/AbcSize
  # Private: Converts degrees to radians
  #
  # angle   - Float with the angle to convert
  #
  # Returns the converted angle in degrees
  private_class_method def self.to_rad(angle)
    angle * Math::PI / 180.00
  end
end
