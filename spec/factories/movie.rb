FactoryBot.define do 
  factory :movie do
    name { 'Name Movie'}
    synopsis { 'Synopsis Movie' }  
    release_year{ '2000' }
    director { 'Director Movie' }
    rating { '5' }
  end

  factory :user do
    email {'matheusmarques03@yahoo.com'}
    password { 'password'}
    password_confirmation { "password" }
    #confirmed_at { Date.today }
  end
end