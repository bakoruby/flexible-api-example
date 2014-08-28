require 'rails_helper'

describe 'GET /v1/contacts/:id' do
  it 'returns a contact by :id' do
    contact = create(:contact)

    get "/v1/contacts/#{contact.id}"

    expect(response_json).to eq(
      {
      'name' => contact.name,
      'address' => contact.address,
      'city' => contact.city,
      'state' => contact.state,
      'zip' => contact.zip
    }
    )
  end
end
