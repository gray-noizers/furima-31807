FactoryBot.define do
    factory :user do
      nickname              {"test"}
      family_name           {"test"}
      first_name            {"test"}
      family_name_furigana  {"test"}
      first_name_furigana   {"test"}
      email                 {"test@example"}
      password              {"000000"}
      password_confirmation {password}
      birthday              {"test"}
    end
end
  