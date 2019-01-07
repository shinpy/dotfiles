directory "#{ENV['HOME']}/.config" do
  owner node[:user]
end

dotfile '.gitignore'
dotfile '.peco'
dotfile '.tmux.conf'
dotfile '.vimrc'
dotfile '.config/karabiner'
