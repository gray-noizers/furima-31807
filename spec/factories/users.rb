FactoryBot.define do
    factory :user do
      nickname              {"test"}
      family_name           {"中南"}
      first_name            {"未来"}
      family_name_furigana  {"ナカミナミ"}
      first_name_furigana   {"ミライ"}
      email                 {"test@example"}
      password              {"0000aaaa"}
      password_confirmation {password}
      birthday              {"1997/01/04"}
    end
end
