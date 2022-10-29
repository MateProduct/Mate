class User < ActiveRecord::Base
  self.primary_key = :uni
  validates :uni, uniqueness: true
end
