FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'高橋'}
    last_name_kana        {'タカハシ'}
    first_name            {'悠太'}
    first_name_kana       {'ユウタ'}
    birthday              {'20200304'}
  end
end