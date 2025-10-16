# Virtual Windows Browser VM

This repository provides a simple setup to create a virtualized Windows 10 machine using Vagrant and libvirt. The VM includes Microsoft Edge browser pre-installed, allowing you to operate the machine remotely as a "virtual browser" environment for testing, isolation, or secure browsing.

## Features
- Runs a full Windows 10 VM
- Pre-installed Microsoft Edge browser
- Remote access via RDP (Remote Desktop Protocol)
- Single command setup and launch

## Prerequisites
- [libvirt](https://libvirt.org/) and [QEMU](https://www.qemu.org/) installed (on Linux)
- [Vagrant](https://www.vagrantup.com/) installed (version 2.2+ recommended)
- At least 16GB RAM and 8 CPUs on host machine (VM allocates 14GB RAM and 7 CPUs)
- RDP client (built-in on Windows/macOS, or [Remmina](https://remmina.org/) on Linux)

## Usage
1. Clone this repository:
   ```
   git clone https://github.com/realharryhero/windows-vm-creator.git
   cd windows-vm-creator
   ```

2. Run the single command to start the VM:
   ```
   vagrant up
   ```
   - This will download the Windows 10 box (~10GB, may take time on first run)
   - Provision the VM with RDP enabled
   - Start the VM in headless mode

3. Access the virtual browser:
   - Use an RDP client to connect to `localhost:3389`
   - Default credentials: `vagrant` / `vagrant` (or `administrator` / `vagrant` if prompted)
   - Once connected, open Microsoft Edge and browse as needed

4. To stop the VM:
   ```
   vagrant halt
   ```

5. To destroy the VM (irreversible):
   ```
   vagrant destroy
   ```

## Accessing Through a Port
- The VM's RDP is forwarded to host port `3389`
- Connect your RDP client to `127.0.0.1:3389` to access the Windows desktop and operate the browser
- If port 3389 is in use, modify the `Vagrantfile` to change the host port

## Troubleshooting
- If `vagrant up` fails, ensure libvirt and Vagrant are properly installed and your user is in the libvirt group
- For slow performance, adjust VM RAM/CPUs in `Vagrantfile`
- If RDP connection fails, verify firewall settings or try a different RDP client

## License
MIT License - Feel free to modify and distribute.