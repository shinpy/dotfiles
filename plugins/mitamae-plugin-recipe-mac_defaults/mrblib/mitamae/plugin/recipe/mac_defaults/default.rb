define :defaults, host: nil, action: :write, value: nil do
  host = case params[:host]
    when :currentHost then "-currentHost"
    when String       then "-host #{params[:host]}"
    else ""
  end

  readType = run_command("defaults #{host} read-type #{params[:name]}", error: false)
  unless readType.success?
    raise ArgumentError, "stdout: #{readType.stdout.inspect} stderr: #{readType.stderr.inspect}"
  end
  type = readType.stdout.chomp.split(' ')[2]

  readValue = run_command("defaults #{host} read #{params[:name]}")
  rawValue = readValue.stdout.chomp
  
  currentValue = case type
    when 'integer' then rawValue.to_i
    when 'float'   then rawValue.to_f
    when 'boolean' then '1' == rawValue
    else rawValue
  end

  if currentValue != params[:value] then
    execute "defaults #{host} write #{params[:name]} -#{type} #{params[:value]}" do
    end
  end
end
