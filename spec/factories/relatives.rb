FactoryBot.define do
  factory :relative do
    sequence(:first_name) { |n| "My article #{n}"}
    sequence(:second_name) { |n| "The content of my article #{n}"}
    sequence(:description) { |n| "my-article-#{n}"}
    sequence(:born) { |n| "The content of my article #{n}"}
  end
end
