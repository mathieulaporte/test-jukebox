require 'rspec_api_documentation/dsl'
require 'spec_helper'
require 'rails_helper'

resource 'List' do
  let(:list)      { CreateList.new('test').call }
  let(:candidate) { CreateCandidate.new('Steve Jobs').call }

  before { AddCandidateToList.new(candidate, list).call }

  post '/lists' do
    example 'Create a list' do
      
    end
  end

  get '/lists' do
    example 'All lists' do
      do_request
      body = JSON.load(response_body)
      expect(status).to eq(200)
      expect(body).to have_key('data')
      expect(body).to have_key('included')
      data = body['data']
      expect(data.count).to eq(1)
      expect(data.first.keys).to contain_exactly('id', 'title', 'candidate_ids')
      included = body['included']
      expect(included.count).to eq(1)
      expect(included.first.keys).to contain_exactly('id', 'name')
    end
  end
end
