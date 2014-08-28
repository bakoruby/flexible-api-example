require 'rails_helper'

describe 'GET /v1/contacts' do
  it 'returns a list of contacts' do
    contact = create(:contact)
    contact_two = create(:contact_two)

    get '/v1/contacts'

    expect(response_json).to eq(
      'contacts' => [
        {'name' => contact.name,
          'address' => contact.address,
          'city' => contact.city,
          'state' => contact.state,
          'zip' => contact.zip },
        {'name' => contact_two.name,
          'address' => contact_two.address,
          'city' => contact_two.city,
          'state' => contact_two.state,
          'zip' => contact_two.zip }])
  end
end

describe 'GET /v1/contacts/:id' do
  it 'returns a contact by :id' do
    contact = create(:contact)

    get "/v1/contacts/#{contact.id}"

    expect(response_json).to eq({
      'contact' => {
      'name' => contact.name,
      'address' => contact.address,
      'city' => contact.city,
      'state' => contact.state,
      'zip' => contact.zip }})
  end
end
