require 'spec_helper'

describe NumericalResponse do
  let(:location) { create(:location) }
  let(:question) { create(:question, :number, short_name: 'short_name', question_text: 'question_text') }

  before { create(:answer, location: location, question: question, numerical_response: 1) }

  subject(:response) { NumericalResponse.new(question, location) }

  its(:short_name) { should == 'short_name' }
  its(:question_text) { should == 'question_text' }
  its(:response_hash) { should == {'Repair' => 1, 'Remove' => 0} }

  context 'with a numeric question' do
    it { should have_numeric_response }
  end

  context 'with a voice question' do
    let(:question) { create(:question, :voice) }

    it { should have_numeric_response }
  end
end
