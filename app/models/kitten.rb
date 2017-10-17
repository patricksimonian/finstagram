class Kitten < ActiveRecord::Base
    #extra code will live here
    belongs_to :owner
    validates :breed, presence: true
end