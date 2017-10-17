class Owner < ActiveRecord::Base
    #extra code will live here
    has_many :kittens
    validates_uniqueness_of :name
    validates :password, :username, presence: true
end