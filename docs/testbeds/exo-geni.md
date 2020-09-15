# ExoGeni

The ExoGeni testbeds are managed with the Flukes tool. In order to use Flukes, you need a recent java installation and `javaws` which is available over the `icedtea-web` package if not included in the default java installation.

## Create a Fed4Fire Account

Visit [https://portal.fed4fire.eu/](https://portal.fed4fire.eu/) to register for a Fed4Fire account.

## Setup Flukes for Testbed Deployment

When the Fed4Fire account was successfully created, visit the dashboard and locate the `Download Login Certificate (PEM)` button at the bottom of the page. Save the certificate to your local home directory.

![Download Button](data:image/png;base64,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)

Next, download Flukes `jnlp` file:

```
$ wget http://geni-images.renci.org/webstart/flukes.jnlp
```

Now create the file `~/.flukes.properties` in your home directory with the following contents:

```
orca.xmlrpc.url=https://geni.renci.org:11443/orca/xmlrpc
user.certfile=/path/to/my/certificate.pem
user.certkeyfile=/path/to/my/certificate.pem
enable.modify=true
ssh.key=~/.ssh/id_dsa
# SSH Public key to install into VM instances
ssh.pubkey=~/.ssh/id_dsa.pub
# Secondary login (works with ssh.other.pubkey)
ssh.other.login=yourname
# Secondary public SSH keys 
ssh.other.pubkey=~/.ssh/id_dsa.pub
# Should the secondary account have sudo privileges
ssh.other.sudo=yes
# Path to XTerm executable on your system
xterm.path=/usr/bin/xterm
```

Set `user.certfile`, `user.certkeyfile`, and `ssh.other.login` accordingly. Additionally, you may want to enter another SSH key than your default one, as Flukes only supports a maximum key length of 1024.

After saving the configuration you can start Flukes with:

```
$ javaws /path/to/flukes.jnlp
```

This will download Flukes and might take a while. If Flukes asks for a password for your PEM file, enter the password you used for your Fed4Fire account.

## Load the Testbed and Run it

When everything is properly setup, Flukes should finally open with an empty screen.

![Flukes Startup](../img/flukes01.png)

Now, download the [default ScionLab Flukes configuration](../deployments/flukes.ndl) and load it into Flukes like this:

![Flukes Open Request](../img/flukes02.png)

![Flukes Loaded Request](../img/flukes03.png)

In order to open the submenus in the toolbar you have to precisely click on the arrows of the dropdown menus. Otherwise, the menus won't open. Also note, that the menu items won't highlight when hovering them. Just click on them and it will eventually work. Be patient, it might take some time...

To configure the duration for which the experiment should run, go to `Configure Slice` / `Reservation Details` and enter the desired duration.

![Flukes Duration Configuration](../img/flukes04.png)

To run your experiment first give it a name and then click on `Slice Operations` / `Submit Changes`.

![Flukes Run](../img/flukes05.png)

After the changes got submitted, Flukes will try to get the resources up and ready. To view the progress on this, click on `My Slices` and select your slice and hit `Query`. The properties of all nodes in the shown graph will contain detailed information on the reservation progress. Alternatively, you can view a summary of all reservations under `Slice Operations` / `View Manifest as List`. If something fails, contact the Fed4Fire support.

## Configure Flukes Machines

> TODO: scionlab user creation script with authorized_keys.

## Updating a Flukes Machine

You can set the GNU/Linux distribution release under `Edit Properties...` in the context menu of all machine nodes in the request graph of Flukes.

![Flukes Node Properties](../img/flukes06.png)

Alternatively, you can follow the instructions for a distribution upgrade from your preferred GNU/Linux distribution.

You can access the machines via SSH with the `scionlab` user over the link to VirtualWall. Please refer to the corresponding IP addresses in the [ScionLab Topology Overview](https://fin-ger.github.io/scionlab-fed4fire-topology/).
