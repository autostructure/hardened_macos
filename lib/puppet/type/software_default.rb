Puppet::Type.newtype(:software_default) do
  desc 'Puppet type that models the OS X software update defaults'

  ensurable

  newparam(:name) do
    desc "Path to the domain plist file"
  end

  newparam(:domain) do
    desc "Path to the domain plist file"
  end

  newparam(:key) do
    desc 'Username for proxy authentication'

    validate do |value|
      raise ArgumentError, "Key must be included ':'" if value.nil?
    end
  end

  newparam(:type) do
    desc 'The datatype of the key'
    newvalues(:string, :int, :integer, :float, :bool, :boolean)
  end

  newproperty(:value) do
    desc 'The value to assign to the key'
  end

  def pre_run_check
    if self[:value].nil?
      raise Puppet::Error, "A value is required!"
    end
  end
end
