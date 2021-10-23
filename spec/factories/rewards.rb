FactoryBot.define do
    factory :reward do
      content {'ケーキを買う'}
    end
  
    factory :second_reward, class: Reward do
      content {'マッサージに行く'}
    end
  
    factory :third_reward, class: Reward do
      content {'30分だらっと過ごす'}
    end

    factory :fourth_reward, class: Reward do
      content {'夜食獲得'}
    end

    factory :reward_user, class: User do
      name { "reward_user" }
      email { "reward_user@example.com" }
      password { "11111111" }
      password_confirmation { "11111111" }
      admin { false }
    end

    factory :reward_user2, class: User do
        name { "reward_user2" }
        email { "reward_user2@example.com" }
        password { "11111111" }
        password_confirmation { "11111111" }
        admin { false }
      end

end
