class ExpenseSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
end
