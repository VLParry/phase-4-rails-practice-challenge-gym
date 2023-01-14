class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client, uniqueness: {scope: :gym}
  #scope says a client can belong to many gyms but only have one membership at each gym. so the clients membership is unique at that one gym 
end
