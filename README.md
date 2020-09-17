# SCIONLab Scripts, Services, and Documentation

This repository contains shell-scripts, systemd services, and a mkdocs documentation for the DFN-GVS, ExoGeni, Grid5000, GTS Géant, and VirtualWall ScionLab testbeds.

Check out the hosted documentation for details on the shell-scripts and systemd services.

[https://scionlab-testbed-documentation.readthedocs.io/en/latest/testbeds/gts/](https://scionlab-testbed-documentation.readthedocs.io/en/latest/testbeds/gts/)

## Host the documentation locally

To host the documentation locally, first install `mkdocs` with your favorite package manager:


### PIP

```
$ pip install --user mkdocs
```

### Fedora

```
# dnf install mkdocs
```

### Ubuntu/Debian

```
# apt install mkdocs
```

The run the following command to get a live-update in your browser while you are typing the documentation.

```
$ cd project/path/
$ mkdocs serve
```

Click on the link printed out in the console and a web-browser should open up with the documentation.

## Troubleshooting

If you encounter any problems please don't hesitate to [open up an issue](https://github.com/jwuensche/scionlab-scripts/issues) on GitHub.
