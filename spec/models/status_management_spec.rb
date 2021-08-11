require 'rails_helper'

RSpec.describe StatusManagement, type: :model do
  let(:users) { create_list(:user, 2) }
  it { should belong_to(:performer) }

  subject do
    described_class.new(
      performer_id: users.first.id,
      receiver_id: users.last.id,
      action: 'archive'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without performer_id' do
    subject.performer_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without action' do
    subject.action = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without receiver_id' do
    subject.receiver_id = nil
    expect(subject).to_not be_valid
  end
end
