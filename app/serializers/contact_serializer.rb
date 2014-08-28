class ContactSerializer < ActiveModel::Serializer
  attributes :name, :address, :city,
    :state, :zip

end
