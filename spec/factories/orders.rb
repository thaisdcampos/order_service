FactoryBot.define do
  factory :order do
    name { 'Thais de Campos' }
    phone { '(11) 91111-1111' }
    email { 'thais.campos@test.com' }
    request_info {
      {
        "question1": "answer1",
        "question2": "answer2",
        "question3": "answer3"
      }
    }

    association :address
  end
end
