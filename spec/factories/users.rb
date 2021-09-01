FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { '0000hy' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { 'たかし' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タカシ' }
    birth_day             { '2021-01-01' }
  end
end
