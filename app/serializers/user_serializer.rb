class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :income, :budget, :yearly, :monthly
  has_many :expenses
end
