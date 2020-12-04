FactoryBot.define do
    factory :log do
      postal_code { "000-0000" }
      prefecture_id {2}
      city {"東京都渋谷区"}
      banchi {"角田333"}
      building {"なんばスカイオ15階"}
      tel { "00000000000" }
      association :user
      association :item
    end
  end