class AddressSerializer < ActiveModel::Serializer
  attributes :street, :city, :state, :zip
end
