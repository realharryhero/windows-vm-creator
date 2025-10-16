Vagrant.configure("2") do |config|
  config.vm.box = "StefanScherer/windows_10"
  config.vm.network "forwarded_port", guest: 3389, host: 7001
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 14336
    vb.cpus = 7
  end
  config.vm.provision "shell", inline: <<-SHELL
    powershell -ExecutionPolicy Bypass -Command "
      # Ensure RDP is enabled
      Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server' -Name 'fDenyTSConnections' -Value 0
      Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'
    "
  SHELL
end
