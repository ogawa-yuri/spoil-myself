FactoryBot.define do
    factory :task do
      content {'英語の勉強'}
      expired_at {'2021/10/31'}
    end
  
    factory :second_task, class: Task do
      content {'買い物'}
      expired_at {'2021/11/1'}
    end
  
    factory :third_task, class: Task do
      content {'スクワット'}
      expired_at {'2021/11/2'}
    end
  
    factory :fourth_task, class: Task do
      content {'プログラミング'}
      expired_at {'2021/11/3'}
    end

    factory :fifth_task, class: Task do
        content {'瞑想'}
        expired_at {'2021/11/4'}
      end

    factory :task_user, class: User do
        name { "task_user" }
        email { "task_user@example.com" }
        password { "11111111" }
        password_confirmation { "11111111" }
        admin { false }
      end

      factory :task_user2, class: User do
        name { "task_user2" }
        email { "task_user2@example.com" }
        password { "11111111" }
        password_confirmation { "11111111" }
        admin { false }
      end
 end