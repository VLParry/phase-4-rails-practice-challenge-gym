class TotalMembershipsSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_memberships
#self is the client object. go to membershop column and sum them 
  def total_memberships
  self.object.memberships.sum(:charge)
  end
end
