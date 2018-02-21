class Kitten < ActiveRecord::Base
    #extra code will live here
    belongs_to :owner
    validates :name, presence: true
    validates :breed, presence: true
end
