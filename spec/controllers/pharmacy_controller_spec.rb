# frozen_string_literal: true

require 'rails_helper'

module PharmacyLocationEngine
  describe PharmacyController, type: :request do
    describe '#pharmacy/nearest' do
      context 'No query params' do
        it 'returns 400' do
          get '/pharmacy/nearest'
          expect(response.code).to eq('400')
        end
      end

      context 'Partial params' do
        it 'returns 400' do
          get '/pharmacy/nearest', params: { latitude: '50' }
          expect(response.code).to eq('400')
        end

        it 'returns 400' do
          get '/pharmacy/nearest', params: { longitude: '80' }
          expect(response.code).to eq('400')
        end
      end

      context 'illformated params' do
        context 'params are not floats' do
          it 'returns 400' do
            get '/pharmacy/nearest', params: { latitude: 'a', longitude: 'b' }
            expect(response.code).to eq('400')
          end
        end

        context 'params are out of range' do
          it 'returns 400' do
            get '/pharmacy/nearest', params: { latitude: '852', longitude: '652' }
            expect(response.code).to eq('400')
          end
        end
      end

      context 'invalid data' do
        it 'returns 500' do
          allow(Pharmacy).to receive(:determine_nearest).and_return(nil)
          get '/pharmacy/nearest', params: { latitude: '45', longitude: '90' }
          expect(response.code).to eq('500')
        end
      end

      context 'valid data' do
        it 'returns 200 and data' do
          mock_pharmacy_data = { name: 'some_name',
                                 address: 'some_address',
                                 city: 'some_city',
                                 state: 'some_state',
                                 zip: 'some_zip',
                                 distance: 56 }

          mock_pharmacy = Pharmacy.new(mock_pharmacy_data)
          allow(Pharmacy).to receive(:determine_nearest).and_return(mock_pharmacy)
          get '/pharmacy/nearest', params: { latitude: '50', longitude: '55' }

          expect(response.code).to eq('200')
          expect(response.body).to_not be_nil
          payload = JSON.parse(response.body)

          expect(payload['nearestPharmacy']).to_not be_nil
          expect(payload['nearestPharmacy']).to eq(JSON.parse(mock_pharmacy_data.to_json))
        end
      end
    end
  end
end
