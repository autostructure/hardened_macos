Puppet::Type.type(:software_default).provide(:default) do
  commands defaults: 'defaults'

  def get_domain_key_value(domain, key)
    begin
      value = defaults(['read', domain, key])
    rescue Puppet::ExecutionFailure => e
      Puppet.debug("#get_domain_key had an error -> #{e.inspect}")
      return nil
    end

    return nil if value =~ /.+does not exist$/
    value
  end

  def exists?
    get_domain_key_value(resource[:domain], resource[:key]) != nil
  end

  def create
    defaults(['write', resource[:domain], resource[:key], resource[:value]])
  end

  def destroy
    defaults(['delete', resource[:domain], resource[:key]])
  end

  def value
    get_domain_key_value(resource[:domain], resource[:key])
  end

  def value=(val)
    defaults(['write', resource[:domain], resource[:key], val])
  end
end
