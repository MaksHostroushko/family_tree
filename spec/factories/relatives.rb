# FactoryBot.define do
#   factory :relative do
#     first_name "Max"
#     second_name "Gostroushko"
#     description "Description"
#     born '12.12.12'
#
#     association :user, factory: :user
#
#     after(:build) do |categ|
#       categ.relatives << build(:relative)
#     end
#   end
# end
