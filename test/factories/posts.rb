FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { [false, true].sample }
    user
  end

  FactoryBot.define do
    factory :published_post, class: 'Post' do
      title { Faker::Lorem.sentence }
      content { Faker::Lorem.paragraph }
      published { true }
      user
    end
  end
end

