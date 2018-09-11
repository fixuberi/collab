FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "category#{n}" }
    sequence(:branch) { |n| "branch#{n}" }
  end
end