FactoryBot.define do
  factory :user do
    nickname              {'shibuya三郎'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'や真ダ'}
    first_name            {'他ろ宇'}
    last_name_Kana        {'ヤマダ'}
    first_name_Kana       {'タロウ'}
    birthday              {Faker::Date.between(from: 100.years.ago, to: Date.today)}
  end
end