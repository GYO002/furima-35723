FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa000'}
    password_confirmation {'aaa000'}
    birthday              {'1980-01-01'}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_name_ruby       {'タナカ'}
    last_name_ruby        {'タロウ'}
  end
end