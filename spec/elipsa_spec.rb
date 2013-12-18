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
    let(:return_value) { Elipsa::elipsa(input, length: length)}

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
  end
end
