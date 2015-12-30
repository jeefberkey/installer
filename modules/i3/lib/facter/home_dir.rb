# find a users home dir using the $HOME variable
Facter.add('home_dir') do
  setcode do
    user = Facter.value(:id)
    Facter::Util::Resolution.exec("echo ~#{user}")
  end
end