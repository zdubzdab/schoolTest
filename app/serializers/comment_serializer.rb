class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :text
  has_one :user
end
