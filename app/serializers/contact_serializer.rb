class ContactSerializer < ActiveModel::Serializer
  attributes :name, :address, :city,
    :state, :zip

  has_many :phones

  def include_associations!
    @options[:included_associations].each do |assoc|
      include! assoc.to_sym
    end
  end

end
