# frozen_string_literal: true

# Public: Migration class for pharmacies
class CreatePharmacies < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
