require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'should inherit behaviour from User' do
    expect(described_class).to be < User
  end
end
