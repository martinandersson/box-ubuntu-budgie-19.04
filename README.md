# A Vagrant box with Ubuntu Budgie 19.04

The artifacts of this project are two `.box` files with
[Ubuntu Budgie 19.04][intro-1] (64bit) installed; one file for the
[VirtualBox][intro-2] provider, and one for [VMware][intro-3].

You don't have to run weird-ass Linux commands to get the artifacts. They are
already built and uploaded [manually] to Vagrant's cloud as
[`pristine/ubuntu-budgie-19.04`][intro-4]<sup>1</sup>. 

_This GitHub project_ is used as 1) an issue tracker, 2) changelog and 3) as an
authoritative source on how exactly the box was built.

<sub><sup>1</sup> The semantical concept captured here is elsewhere described as
a "minimal" and/or "base" box. I refrain from using either term since 1.6 GB
is hardly "minimal" nor am I convinced that all use-cases of this box are to
derive yet another box as implied by the word "base". We are building a box.
Period.</sub>

[intro-1]: https://ubuntubudgie.org/
[intro-2]: https://www.vagrantup.com/docs/virtualbox/
[intro-3]: https://www.vagrantup.com/docs/vmware/
[intro-4]: https://app.vagrantup.com/pristine/boxes/ubuntu-budgie-19.04

## Using the box

Make sure you have [Vagrant][using-1] and at least one of the supported VM
providers installed<sup>2</sup>, then in theory, all you should have to do in
order to get a Virtual Machine up and running with Ubuntu Budgie 19 is:

    vagrant init pristine/ubuntu-budgie-19.04
    vagrant up

<sub><sup>2</sup> Can not really recommend anyone. Both VirtualBox and VMware
suck equally much. Okay, VMware sucks a little bit less.

[using-1]: https://www.vagrantup.com

## Building the box

To build the boxes using [Packer][dev-1], do this:

    packer build template.json

Or, one provider at a time:

    packer build -only virtualbox-iso template.json

..best of luck to you. `template.json`'s "boot command" uses VNC to literally
click on the installer's GUI buttons in order to install the OS. This procedure
is extremely host-machine dependent with wait-settings tailored to my particular 
hardware. I.e., I would be surprised if you can run the previously quoted
commands without any issues. In fact, I can't even do that. It only works half
of the times for me.

[dev-1]: http://packer.io