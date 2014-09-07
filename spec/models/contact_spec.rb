require 'rails_helper'

describe Contact, 'Validations' do
  it { should validate_presence_of(:name) }
end

describe Contact, 'Associations' do
  it { should have_many(:phones) }
  it { should have_many(:addresses) }
end
