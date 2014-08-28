class ContactSerializer < ActiveModel::Serializer
  attributes :name, :address, :city,
    :state, :zip

  has_many :phones

  def include_phones?
    @options['include_phones']
  end
end
