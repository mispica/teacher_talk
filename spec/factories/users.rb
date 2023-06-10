FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    name                  { person.last.kanji + person.first.kanji }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    age_id                { Faker::Number.between(from: 2, to: 6) }
    subject_id            { Faker::Number.between(from: 2, to: 11) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    operation_id          { Faker::Number.between(from: 2, to: 4) }
    schooltype_id         { Faker::Number.between(from: 2, to: 4) }
    school_name           { Gimei.town.kanji + "高等学校" }
  end
end