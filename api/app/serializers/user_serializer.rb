class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :full_name, :email, :klass_id

  has_one :klass_id
end