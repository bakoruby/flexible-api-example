class MoveAddressToSeperateModel < ActiveRecord::Migration
  def up
    Contact.transaction do
      Contact.all.each do |contact|
        Address.create!(street: contact.address,
                        city: contact.city,
                        state: contact.state,
                        zip: contact.zip,
                        contact: contact)
      end
      remove_column :contacts, :address
      remove_column :contacts, :city
      remove_column :contacts, :state
      remove_column :contacts, :zip
    end
  end

  def down
    # This will only copy the first address to the model
    Contact.transaction do
      add_column :contacts, :address, :string
      add_column :contacts, :city, :string
      add_column :contacts, :state, :string
      add_column :contacts, :zip, :string
      Contact.all.each do |contact|
        if address = contact.addresses.first
          contact.address = address.street
          contact.city = address.city
          contact.state = address.state
          contact.zip = address.zip
          contact.save!
        end
      end
    end
  end
end
