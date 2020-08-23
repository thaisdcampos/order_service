require 'rails_helper'

RSpec.describe "V1::Orders", type: :request do
  context 'create an order' do
    let(:params) do
      {
        user_info: {
          phone: '(11) 98765-4321',
          name: 'João da Silva',
          email: 'joao_silva@exemplo.com'
        },
        address_attributes: {
          city: 'São Paulo',
          neighborhood: 'Jardim Paulista',
          street: 'Avenida São Gabriel',
          uf: 'SP',
          zip_code: '01435-001'
        },
        request_info: {
          question1: 'answer1',
        }
      }
    end

    it 'creates an order' do
      expect { post '/v1/orders', params: params }.to change(Order, :count).from(0).to(1)
    end

    it 'shows a new order' do
      post '/v1/orders', params: params

      expect(JSON.parse(response.body)['name']).to eq('João da Silva')
    end

    it 'returns status code 201' do
      post '/v1/orders', params: params

      expect(response).to have_http_status(201)
    end
  end

  context 'update an order' do
    let(:order) { create(:order) }
    let(:params) do
      {
        address_attributes: {
          latitude: -83.1471633,
          longitude: -6.3897136
        }
      }
    end

    before do
      put "/v1/orders/#{order.id}", params: params
      order.reload
    end

    it 'returns status code 200' do
        expect(response).to have_http_status(200)
    end

    it 'changes the updated attribute' do
      expect(order.address[:latitude]).to eq params[:address_attributes][:latitude]
      expect(order.address[:longitude]).to eq params[:address_attributes][:longitude]
    end
  end
end
