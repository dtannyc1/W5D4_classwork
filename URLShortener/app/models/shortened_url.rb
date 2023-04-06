# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true, presence: true
    validates :user_id, presence: true

    def self.random_code
        str = SecureRandom.urlsafe_base64
       while self.exists?(:short_url => str)
        str = SecureRandom.urlsafe_base64
       end
       return str
    end

    def num_clicks
        self.visitors.count
    end

    def num_uniques
        visitor_ids = self.visitors.map {|visitor| visitor.id}
        visitor_ids.uniq
        visitor_ids.count
    end

    def recent_uniques
        # recent_visitors = self.visitors where (10.minutes.ago)
        recent_visitors = 
        visitor_ids = recent_visitors.map {|visitor| visitor.id}
        visitor_ids.uniq
        visitor_ids.count
    end

    after_initialize do |shortenedurl|
        generate_short_url
    end

    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

    has_many :visitors,
    through: :visits,
    source: :visitor

    private
    def generate_short_url
        if !short_url
            self.short_url = ShortenedUrl.random_code
        end
    end
end
