directory "#{ENV['HOME']}/.config" do
  owner node[:user]
end

dotfile '.gitconfig'
dotfile '.gitignore'
dotfile '.peco'
dotfile '.tmux.conf'
dotfile '.vimrc'
dotfile '.config/karabiner'
