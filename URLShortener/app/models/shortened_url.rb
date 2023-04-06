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
        self.exists?(:short_url => str)
    end

    after_initialize do |shortenedurl|
        generate_short_url
    end

    private
    def generate_short_url

    end
end
