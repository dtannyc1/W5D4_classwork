# == Schema Information
#
# Table name: visits
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  shortened_url_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Visit < ApplicationRecord

    belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    belongs_to :visited,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

end
