FactoryBot.define do
  factory :purchase_address do
    post_code                     {"123-4567"}
    prefecture_id                 {2}
    city_name                     {"横浜市緑区"}
    street                        {"青山1-1-1"}
    phone_number                  {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
