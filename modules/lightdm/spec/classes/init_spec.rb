require 'spec_helper'
describe 'lightdm' do

  context 'with defaults for all parameters' do
    it { should contain_class('lightdm') }
  end
end
