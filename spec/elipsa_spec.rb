# encoding: utf-8

require 'elipsa'

shared_examples_for :elipsa do
  subject { return_value }
  its(:length) { should be <= length }
  it { should eq expected }
end

describe Elipsa do
  context '#elipsa' do
    let(:length) { 20 }
    let(:params) { {length: length} }
    let(:return_value) { Elipsa::elipsa(input, params)}

    context 'a short string' do
      let(:input) { 'a short string' }
      let(:expected) { input }

      it_should_behave_like :elipsa
    end

    context 'word-boundary' do
      let(:input) { 'a longer string that goes over the limit' }
      let(:expected) { 'a longer string...' }

      it_should_behave_like :elipsa
    end

    context 'mid-large-word' do
      let(:input) { 'supercalifragilisticexpialidocious' }
      let(:expected) { 'supercalifragilis...' }

      it_should_behave_like :elipsa
    end

    context 'exact length' do
      let(:input) { 'at twenty characters' }
      let(:expected) { input }

      it_should_behave_like :elipsa
    end

    context 'one less' do
      let(:input) { 'nineteen characters' }
      let(:expected) { input }

      it_should_behave_like :elipsa
    end

    context 'trim punctuation' do
      let(:input) { 'Let\'s go fly a kite, up to the highest height'  }
      #                                  ^ this comma should not be included
      let(:length) { 24 }
      let(:expected) { 'Let\'s go fly a kite...' }

      it_should_behave_like :elipsa
    end

    context 'alternate symbol' do
      before(:each) { params.merge!(symbol: '…') }

      let(:input) { 'lorem ipsum dolor sit' }
      # with default symbol '...', this would be 'lorem ipsum...'
      let(:expected) { 'lorem ipsum dolor…' }

      it_should_behave_like :elipsa
    end
  end
end
