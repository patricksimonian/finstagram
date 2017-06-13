class LotrCharacter < ActiveRecord::Base
  validates_presence_of :name, :age, :race, :icon_url
end