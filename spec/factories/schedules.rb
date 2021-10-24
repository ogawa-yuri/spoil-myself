FactoryBot.define do
    factory :schedule do
      content {'英語の勉強'}
      start_time {'2021/10/31'}
    end
  
    factory :second_schedule, class: Schedule do
      content {'買い物'}
      start_time {'2021/11/1'}
    end
  
    factory :third_schedule, class: Schedule do
      content {'スクワット'}
      start_time {'2021/11/2'}
    end
  
    factory :fourth_schedule, class: Schedule do
      content {'プログラミング'}
      start_time {'2021/11/3'}
    end

    factory :fifth_schedule, class: Schedule do
        content {'瞑想'}
        start_time {'2021/11/4'}
      end

      factory :schedule_user, class: User do
        name { "schedule_user" }
        email { "schedule_user@example.com" }
        password { "11111111" }
        password_confirmation { "11111111" }
        admin { false }
      end

      factory :schedule_user2, class: User do
        name { "schedule_user2" }
        email { "schedule_user2@example.com" }
        password { "11111111" }
        password_confirmation { "11111111" }
        admin { false }
      end
      
end