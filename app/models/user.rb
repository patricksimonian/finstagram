class User < ActiveRecord::Base
   validates :avatar_url, presence: true
   validates :avatar_url, format: { with: URI.regexp }, if: 'avatar_url.present?'
   validates :email, presence: true, uniqueness: true
   validates :username, presence: true, uniqueness: true
   validates :password, presence: true
end

