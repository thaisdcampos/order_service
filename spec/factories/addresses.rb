FactoryBot.define do
  factory :address do
    city { 'São Paulo' }
    neighborhood { 'Pinheiros' }
    street { 'Avenida Faria Lima' }
    uf { 'SP' }
    zip_code { '01451-913' }
    latitude { nil }
    longitude { nil }
  end
end
