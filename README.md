# Auto-Unlock BitLocker without a Trusted Platform Module (TPM) hardware component by Rodney Lewis

Its important for applications to function autonomously and its equally important to protect the integretity of the data that is being accessed. The big goal is that all data at rest is required to be encrypted and applications that access it understands the alogorithm necessary to decrypt that data. In this example, I will bite off a small chunk of this theory. Thus, I will start this jorney by having you follow these steps to encrypt any plain-text password and save it to file. This alone prevents storing a password in plain text. I will then show you how to recall an encrypted password from a file with PowerShell a script and suttle hints to my C# implementation.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system. BitLocker provides the most protection when used with a Trusted Platform Module (TPM) version 1.2 or later. The TPM is a hardware component installed in many newer computers by the computer manufacturers. It works with BitLocker to help protect user data and to ensure that a computer has not been tampered with while the system was offline. However, some older machines and some virtual machines (VMs) do not provide this protection. In this case you may get an error messages like the follwoing when installing BitLocker.

To determine if your machine has the hardware protection module (TPM) follow this first step required to auto-unlock your already encrypted BitLocker drive. Right-click on a protected BitLocker drive and click Manage BitLocker. In this BitLocker Drive Encryption interface click on Turn on auto-unlock. Two things could happen. 1) TPM hardware is present and software is installed successfully. Or, 2) the Stack Trace begins :

* The operating system drive is not protected by BitLocker Drive Encryption.

* This device can't use a Trusted Platform Module. Your administrator must set the "Allow BitLocker without a compatible TPM" option in the "Require additional authentication ar startup" policy for OS volumes.

### Prerequisites

BitLocker owns this market share for this space so I will use BitLocker for our data encryption purposes.

```
BitLocker
NSSM - the Non-Sucking Service Module
Windows PowerShell ISE 
Visual Studio/VS Code/C#/.Net Standard (Optional)
```

### Installing

Let's face it we live in a society where there's nothing new under the sun. Everything that exists exist. From the words of Google, "There is nothing in the world that has not already happened, been seen, or been created; things exist now as they always have.". Moreover, my life as a developer today is more of a widget integrator and I have become a superstar at integrating widgets. Moreover, I am a strong supporter of the open source community. My job as an superstar Software Engineer is be sure that tools and tech which I use today will be if not already purchased by the big guns like Microsoft, Google or Apple. Moreover, in this project most of which has already been acquired my Microsoft and is baked into the their Windows Professional line of operating systems and/or Visual line of development tools. NSSM is an open source Windows helper utility used to allow us developers to create a Windows Service from our PowerShell script (e.g. Unlock.ps1). Later in this guide I will show you how create your PowerShell script into a .ps1 file so it can be run by the PowerShell execuable.

```
C:\WINDOWS\system32> powershell.exe Unlock.ps1
```

Or, the supper geeks like use Windows PowerShell ISE

```
PS C:\WINDOWS\system32>  C:\src\PS\Unlock.ps1
```

* [BitLocker](https://support.microsoft.com/en-us/windows/turn-on-device-encryption-0c453637-bc88-5f74-5105-741561aae838) - BitLocker Drive Encryption is a data protection feature that integrates with the operating system and addresses the threats of today ...
* [NSSM](https://nssm.cc/download) - nssm is a service helper which doesn't suck. srvany and other service helper programs suck because they don't handle failure of the application running as a service ...
* [VS Code](https://code.visualstudio.com/download) - Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications.

### Running the tests

### Follow this step by step quide to get your development environment up and running quickly.

1. Lock Drive with PowerShell command. How would your accompolish this with C#?

```
PS C:\WINDOWS\system32> Lock-BitLocker -MountPoint "F:" -ForceDismount
```

2. Encrypt any password and save to file. How would your accompolish this with C#?

```
PS C:\WINDOWS\system32> $SecureString = ConvertTo-SecureString ">Lza86BW>CaR2LF%" -AsPlainText -Force
PS C:\WINDOWS\system32> $encpwd = ConvertFrom-SecureString -SecureString $SecureString
PS C:\WINDOWS\system32> $encpwd > $path\bitlocker\password.bin
```

3. Decrypt any password password previously saved to file. How would your accompolish this with C#?

```
PS C:\WINDOWS\system32> $encpwd = Get-Content $path\bitlocker\password.bin
PS C:\WINDOWS\system32> $passwd = ConvertTo-SecureString $encpwd
PS C:\WINDOWS\system32> Unlock-BitLocker -MountPoint "F:" -Password $passwd
```

End with an example of getting some data out of the system or using it for a little demo


### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

