require 'spec_helper'
describe 'i3' do

  context 'with defaults for all parameters' do
    let(:params) {{ }}
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to create_class('i3') }
  end
end
