# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  canonical_title    :string           not null
#  description        :string
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  anidb_id           :integer          indexed
#  parent_id          :integer          indexed
#
# Indexes
#
#  index_categories_on_anidb_id   (anidb_id)
#  index_categories_on_parent_id  (parent_id)
#

FactoryGirl.define do
  factory :category do
  end
end
