class Owner < ActiveRecord::Base
    #extra code will live here
    has_many :kittens
end



























# validates :password, :username, presence: true
# validates_uniqueness_of :name