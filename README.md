# Toggle Hyper-V on Windows

As of October 4, 2019, you cannot run the Hyper-V Hypervisor at the same time as VirtualBox. In order to toggle between the two, I made Batch files to toggle the Hyper-V HyperVisor on Windows on or off. It is compatible with Windows Subsytem for Linux (WSL). These scripts will need to be run as administrator to be executed properly. They give the option to reset the computer after toggling Hyper-V, which is required for the changes to take full effect.

The `enable_HyperV.bat` and `disable_HyperV.bat` files are macros for calling the `set_HyperV.bat` with their respective arguments, allowing for easy shortcuts on the desktop.
They each call the `set_HyperV.bat` script by calling Powershell from WSL.

In order to call any file from the WSL command line, use `powershell.exe ./set_HyperV.bat enable` or `powershell.exe ./set_HyperV.bat disable`. The respective versions utilizing the macro files are `powershell.exe ./enable_HyperV.bat` and `powershell.exe ./enable_HyperV.bat`.

In order to call them from Batch, just run the scripts.
