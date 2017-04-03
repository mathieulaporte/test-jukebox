require 'spec_helper'
require 'rails_helper'

describe CreateList do
  describe '#call' do
    let(:list_title) { 'test_list' }
    subject { described_class.new(list_title) }
    let(:created_list) { subject.call }
    it { expect { subject.call }.to change { Repository.for(:list).count } }
    it { expect(subject.call).to be_a(List) }
    it { expect(created_list.title).to eq(list_title) }
  end
end
