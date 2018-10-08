# Overview

This folder contains a bunch of scripts which helps the Windows users to mount network drives.

# Quickstart

On a Windows client, open a Powershell window and run:

    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mimacom/azure-client-migration/master/network-share/install.ps1'))

# Script description

## install.ps1

Used once, ran on a Windows 10 client, which downloads and installs the network share mount script onto the system.

## download.ps1

This script is being downloaded and installed by `install.ps1` into the autostart and start menu. It's just a wrapper which downloads and executes the actual mount-shares script.

## mount.ps1

This script checks if NAS is available, and mounts the network drives.