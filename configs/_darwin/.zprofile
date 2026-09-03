# POSIX.1 (IEEE Std 1003.1) defines .profile for login-shell environment setup.
# Most UNIX session managers bridge that into graphical login. Apple couldn't
# be bothered, so every shell has to be fucking told to source it.
# macOS; UNIX 03 certified btw.
. $HOME/.profile

eval "$(/opt/homebrew/bin/brew shellenv)"

