directory "#{ENV['HOME']}/.config" do
  owner node[:user]
end

dotfile '.gitconfig'
dotfile '.config/git'
dotfile '.peco'
dotfile '.tmux.conf'
dotfile '.vimrc'
dotfile '.config/karabiner'
