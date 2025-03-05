[![Release](https://img.shields.io/github/v/release/KaioHSG/nvidia-broadcast-downgrader)](https://github.com/KaioHSG/nvidia-broadcast-downgrader/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/KaioHSG/nvidia-broadcast-downgrader/total)](https://github.com/KaioHSG/nvidia-broadcast-downgrader/releases)
[![VirusTotal](https://img.shields.io/badge/virustotal-status-navy)](https://www.virustotal.com/gui/file/03d70c9fb9b95af7f67d4d83401a677337a5c84c12e4a6b2284f49d6746a25a7)

# NVIDIA Broadcast Downgrader

A simple script to download a old version of NVIDIA Broadcast and block update requests.

## How to use?

1. Download [**`NVIDIA-Broadcast-Downgrader.bat`**](https://github.com/KaioHSG/nvidia-broadcast-downgrader/releases/latest).
2. Run the script and accept the administrator options.
3. Wait for the NVIDIA Broadcast download and follow the installation steps.

## How to remove the Update Block?

1. Run the **`Update-Block-Remove.bat`** file as an administrator (if you don’t have the file, download it [**here**](https://github.com/KaioHSG/nvidia-broadcast-downgrader/blob/main/Update-Block-Remove.bat)). Or with the Command Prompt (CMD) as administrator, run the line below.

``` console
netsh advfirewall firewall delete rule name="NVIDIA Broadcast Downgrader"
```

Now the update requests are available.
