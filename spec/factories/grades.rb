FactoryBot.define do
  factory :grade do
    sequence(:student_id){ |n| "#{n}#{n}#{n}#{n}#{n}"}
    sequence(:student_name) { |n| "Student #{n}" }

    trait :valid do
      student_grade { 70 }
    end

    trait :invalid do
      student_grade { -70 }
    end

    trait :invalid do
      student_grade { 105 }
    end
  end
end
