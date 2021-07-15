FactoryBot.define do
  factory :user do
    nickname                     {"tarou"}
    email                       {Faker::Internet.free_email}
    password                    {"aaa4567"}
    password_confirmation          {"aaa4567"}
    last_name                   {"山田"}
    first_name                  {"太朗"}
    last_name_kana              {"ヤマダ"}
    first_name_kana             {"タロウ"}
    birth_day                   {"1930-01-01"}
  end
end