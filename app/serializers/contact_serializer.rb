class ContactSerializer < ActiveModel::Serializer
  attributes :name, :href

  has_many :phones
  has_many :addresses

  def href
    v1_contact_url(object)
  end

  def include_associations!
    @options[:included_associations].each do |assoc|
      include! assoc.to_sym
    end
  end

end
