# frozen_string_literal: true

# Public: Controller to handle requests from /pharmacy
class PharmacyController < ApplicationController
  # Public: Retrieves closest pharmacy given lat/long coords
  #
  # Params: See API documentation for required parameters
  #
  # Returns nearest pharmacy, see API documentation
  # rubocop:disable Metrics/AbcSize
  def nearest
    # Params are required
    params.require(%i[latitude longitude])

    # latitude and longitude must be between predefined values and floats
    return head 400 unless Float(params[:latitude]).between?(-90, 90) || Float(params[:longitude]).between?(-180, 180)

    @nearest_pharmacy = Pharmacy.determine_nearest(params[:latitude], params[:longitude])

    return head 500 unless !@nearest_pharmacy.nil? && !@nearest_pharmacy.distance.nil?

    render formats: :json

    # Rescue missing params or invalid params
  rescue ActionController::ParameterMissing, ArgumentError
    head 400
    # rubocop:enable Metrics/AbcSize
  end
end
