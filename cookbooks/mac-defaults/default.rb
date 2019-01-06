# Keyboard
defaults '-g AppleKeyboardUIMode' do
  value 3
end

defaults '-g KeyRepeat' do
  value 2
end

defaults '-g InitialKeyRepeat' do
  value 15
end

# Trackpad
## Enable `Tap to click`
defaults 'com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking' do
  value true
end

defaults '-g com.apple.trackpad.scaling' do
    value 2.5
  end

defaults '-g com.apple.swipescrolldirection' do
  value false
end

# Finder
## Display the file extensions
defaults 'NSGlobalDomain AppleShowAllExtensions' do
  value true
end

defaults 'com.apple.finder AppleShowAllFiles' do
  value true
end

defaults 'com.apple.finder ShowStatusBar' do
  value true
end

defaults 'com.apple.finder ShowPathbar' do
  value true
end

# Dock
## Automatically hide or show the Dock
defaults 'com.apple.dock autohide' do
  value true
end

# Menubar
defaults 'com.apple.menuextra.battery ShowPercent' do
  value 'YES'
end

# Desktop
## bottom right corner
defaults 'com.apple.dock wvous-br-corner' do
  value 10
end
defaults 'com.apple.dock wvous-br-modifier' do
  value 0
end

# Screen Capture
defaults 'com.apple.screencapture disable-shadow' do
  value true
end

defaults 'com.apple.screencapture name' do
  value "SS_"
end
