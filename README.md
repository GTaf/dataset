# frap-dataset

In `vul-experimental-data` folder, we have experimental datasets of 11 different exploits.
Within each exploit folder, we have the following folders:
- `bad-behv`: contains raw provenance data of the experiment whose vulnerability was being exploited when running; this dataset is used for testing.
- `good-behv`: contains raw provenance data of the experiment with normal behavior; this dataset is used for semi-supervised training
- `validate`: contains also good behavior of the experiment; this dataset is used for cross-validation. Data in this folder are not the same as the ones in `good-behv`.
- `mix-behv`: contains a mixture of good and bad behavior; this dataset is used for testing as well.

---
All vulnerabilities should work on dennisli1/frapbox, which has operating system fedora 25, camflow 4.11.6 installed, and virtualbox guest additions 5.1.22 installed.  As for the requirement of the host machines, they should have VirtualBox 5.1.22 installed, otherwise there will be a virtualbox guest additions compatibility issue, which will cause shared folder issue. However, this can be solved by vagrant-vbguest plugin. But, if the kernel development module is not named exactly as kernel-devel-`uname -r`, it will complain not finding the kernel-devel and fail to upgrade/downgrade the guest additions on the VM to match the version on the host. 

However, dennisli1/frapbox does not have the latest camflow 4.12.4 installed, because it only works on feodra26. And, /etc/camflow-machine_id and /etc/camflow-boot_id were not deleted before repackaging the box, resulting in the same camflow-machine_id file and the same camflow-boot_id file in every VM using this box. 

In an attempt to remove both files before repackaging and updating camflow to the lastest version 4.12.4, the new box dennisli1/frapboxfc26 VMs boot up with different machine ids every time. However, there are several issues with fedora26. First, reboot seems to be a problem. The OS gets stuck on or before the login page without a clear pattern (mostly happen after the second reboot). Second, for some exploits to work, it has to have certain versions of the kernel libraries installed, but they can't be downgraded directly using dnf simply because the repository does not contain the older versions. In an attempt to remove them and install the older versions through rpm packages, some of kernel libraries can't be removed through dnf due to the consequences of removing "protected packages" like the program sudo. 

## Update after fork from GTaf

Many attacks were not working 10 months after the creation of the initial dataset, this is because many of the rpms host removed them. Even after during the time I worked on this repository some of the rpm have been deleted. So there is a need to be able to store this rpms somewhere, to have this dataset running on the long term.

Furthermore, there is a need to be sure that the attacks are really attacks. Vagrant is by default running every scripts as root, so gaining root access being already root might not be interesting to detect real attacks. You have to explicitely tell Vagrant to use a normal user for the scripts.

The updated working attacks as of 07/18/2018 are `wget`, `Tomcat`, `mariaDB-race`, `mariaDB-root`. `nagios` works but the scripts are still run as root. Getting attacks based on Percona and MySQL should not be hard. I did not look at the Ruby attack.


## List of vulnerabilities:
- `wget`: CVE-2016-4971
- `nagios`: CVE-2016-9566
- `MySQL / MariaDB / Percona Race Condition`: CVE-2016-6663 / (Oracle) CVE-2016-5616
- `MySQL / MariaDB / Percona Root Privilege Escalation`: CVE-2016-6664 / (Oracle) CVE-2016-5617
- `Apache Tomcat Root Privilege Escalation`: CVE-2016-5425
- `Ruby OOM Server Crash`: https://bugs.ruby-lang.org/issues/11692
