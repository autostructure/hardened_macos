require 'spec_helper'
describe 'mac_csi_secure' do
  context 'with default values for all parameters' do
    it { should contain_class('mac_csi_secure') }
  end
end
