
node.reverse_merge!(
  os: run_command('uname').stdout.strip.downcase,
)

define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    to File.expand_path("../../../config/#{source}", __FILE__)
    user node[:user]
  end
end

define :defaults, host: nil, action: :write, value: nil do
  host =
    case params[:host]
    when :currentHost then "-currentHost"
    when String       then "-host #{params[:host]}"
    else ""
    end

  type =
    case params[:value]
    when String                then "-string"
    when Integer               then "-integer"
    when Float                 then "-float"
    when TrueClass, FalseClass then "-boolean"
    end

  execute "defaults #{host} write #{params[:name]} #{type} #{params[:value]}" do
  end
end

define :github_binary, version: nil, repository: nil, archive: nil, binary_path: nil do
  cmd = params[:name]
  bin_path = "#{ENV['HOME']}/bin/#{cmd}"
  archive = params[:archive]
  url = "https://github.com/#{params[:repository]}/releases/download/#{params[:version]}/#{archive}"

  if archive.end_with?('.zip')
    extract = "unzip -o"
  elsif archive.end_with?('.tar.gz')
    extract = "tar xvzf"
  else
    raise "unexpected ext archive: #{archive}"
  end

  execute "curl -fSL -o /tmp/#{archive} #{url}" do
    not_if "test -f #{bin_path}"
  end
  execute "#{extract} /tmp/#{archive}" do
    not_if "test -f #{bin_path}"
    cwd "/tmp"
  end
  execute "mv /tmp/#{params[:binary_path] || cmd} #{bin_path} && chmod +x #{path}" do
    not_if "test -f #{bin_path}"
  end
end


define :binary, url: nil, binary_path: nil do
  cmd = params[:name]
  url = params[:url]

  bin_path = "#{ENV['HOME']}/bin/#{cmd}"

  execute "curl -fSL -o /tmp/#{cmd} #{url}" do
    not_if "test -f #{bin_path}"
  end

  extract_cmd = nil
  if url.end_with?('.zip')
    extract_cmd = "unzip -o"
  elsif url.end_with?('.tar.gz')
    extract_cmd = "tar xvzf"
  end

  if !(extract_cmd.nil?) then
    execute "#{extract} /tmp/#{cmd}" do
      not_if "test -f #{bin_path}"
      cwd "/tmp"
    end
  end

  execute "mv /tmp/#{cmd} #{bin_path} && chmod +x #{bin_path}" do
    not_if "test -f #{bin_path}"
  end
end

