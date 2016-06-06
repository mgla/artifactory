require 'spec_helper'
describe 'artifactory' do

  context 'with defaults for all parameters' do
    it { should contain_class('artifactory') }
  end
end
