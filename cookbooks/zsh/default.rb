file "/etc/shells" do
	user "root"
	block do | content |
		content.concat <<-EOS
/usr/local/bin/zsh
		EOS
	end
	action :nothing
end

execute "dummy" do
	not_if "cat /etc/shells | grep -sq '/usr/local/bin/zsh'"
	command ""
	notifies :edit, 'file[/etc/shells]', :immediately
end

execute "chsh" do
	not_if "[ $SHELL = '/usr/local/bin/zsh' ]"
	command "chsh -s /usr/local/bin/zsh"
end


dotfile '.zsh'
dotfile '.zshenv'

# Prezto
git "#{ENV['HOME']}/.zsh/prezto" do
	repository "https://github.com/sorin-ionescu/prezto.git"
	recursive true
end

# Zsh configuration
%w[
zlogin
zlogout
].each do |cfg|
	link File.join(ENV['HOME'], ".zsh/", "." << cfg) do
		to File.join(ENV['HOME'], ".zsh/prezto/runcoms", cfg)
		user node[:user]
	end
end

