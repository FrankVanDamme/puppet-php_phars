require 'spec_helper'
describe 'php_phars' do

  context 'with defaults for all parameters' do
    it { should contain_class('php_phars') }
  end
end
