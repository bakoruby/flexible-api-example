require 'rails_helper'

describe 'GET /v1/contacts' do

  it 'returns a list of contacts that matches the search query' do
    contact = create(:contact)
    create(:contact_two)

    get '/v1/contacts?q[name_start]=Rob'

    expect(response_json).to eq(
      'contacts' => [
        {'name' => contact.name,
         'href' => v1_contact_url(contact)}])
  end

  it 'returns a list of contacts that matches the search query and includes phones' do
    contact = create(:contact)
    phone = create(:phone, contact: contact)
    create(:contact_two)

    get '/v1/contacts?q[name_start]=Rob&includes[]=phones'

    expect(response_json).to eq(
      'contacts' => [
        {'name' => contact.name,
         'href' => v1_contact_url(contact),
         'phones' => [
           {'number' => phone.number }
         ]}])
  end

  it 'returns a list of contacts that matches the search query and includes addresses' do
    contact = create(:contact)
    address = create(:address, contact: contact)
    create(:contact_two)

    get '/v1/contacts?q[name_start]=Rob&includes[]=addresses'

    expect(response_json).to eq(
      'contacts' => [
        {'name' => contact.name,
         'href' => v1_contact_url(contact),
         'addresses' => [
           {'street' => address.street,
             'city' => address.city,
             'state' => address.state,
             'zip' => address.zip}
         ]}])
  end

  it 'returns a list of contacts that matches the search query and includes phones and addresses' do
    contact = create(:contact)
    phone = create(:phone, contact: contact)
    address = create(:address, contact: contact)
    create(:contact_two)

    get '/v1/contacts?q[name_start]=Rob&includes[]=phones&includes[]=addresses'

    expect(response_json).to eq(
      'contacts' => [
        {'name' => contact.name,
         'href' => v1_contact_url(contact),
         'addresses' => [
           {'street' => address.street,
             'city' => address.city,
             'state' => address.state,
             'zip' => address.zip}],
         'phones' => [
           {'number' => phone.number}
         ]}])
  end
end
