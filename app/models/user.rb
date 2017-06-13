class User < ActiveRecord::Base
   validates_presence_of :email, :avatar_url, :username, :password
   validates_uniqueness_of :email, :username
end

