# frozen_string_literal: true

module PharmacyLocationEngine
  describe Pharmacy do
    describe '#determine_nearest' do
      context 'good data' do
        it 'returns the closest pharmacy' do
          pharmacy_name = 'WAL-MART PHARMACY'
          pharmacy_address = '10300 E HWY 350'
          pharmacy_city = 'RAYTOWN'
          pharmacy_state = 'MO'
          pharmacy_zip = '64133'
          pharmacy_distance = 5.577343196906536

          closest_pharmacy = Pharmacy.determine_nearest('38.920780', '-94.394570')
          expect(closest_pharmacy).to_not be_nil
          expect(closest_pharmacy.name).to eq(pharmacy_name)
          expect(closest_pharmacy.address).to eq(pharmacy_address)
          expect(closest_pharmacy.city).to eq(pharmacy_city)
          expect(closest_pharmacy.state).to eq(pharmacy_state)
          expect(closest_pharmacy.zip).to eq(pharmacy_zip)
          expect(closest_pharmacy.distance).to eq(pharmacy_distance)
        end
      end
    end
  end
end
