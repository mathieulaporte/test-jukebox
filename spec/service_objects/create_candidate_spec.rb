require 'spec_helper'
require 'rails_helper'

describe CreateCandidate do
  describe '#call' do
    let(:candidate_name) { 'Steve Jobs' }
    subject { described_class.new(candidate_name) }
    let(:created_candidate) { subject.call }
    it { expect { subject.call }.to change { Repository.for(:candidate).count } }
    it { expect(subject.call).to be_a(Candidate) }
    it { expect(created_candidate.name).to eq(candidate_name) }
  end
end
