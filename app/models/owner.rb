class Owner < ActiveRecord::Base
    #extra code will live here
    has_many :kittens
    validates :username, presence: true, length: { minimum: 2 }
    validates :name, presence: true
end



























# validates :password, :username, presence: true
# validates_uniqueness_of :name