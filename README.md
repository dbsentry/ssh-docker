# ssh-docker

An SSH server Docker image created to demo Keyper, Keys and Certificate based authentication system. Demo for this image is running as mavrix2.dbsentry.com, mavrix3.dbsentry.com, mavrix4.dbsentry.com, and mavrix5.dbsentry.com/ All logins to this image via SSH are protected using highly restricted lshell. Logged in users are restricted to run very few shell commands, and more than three unauthorized commands kicks out the user.

Other then Keyper Demo, and learning about Docker tooling, this image does not have much use.


## Installation/Build
Follow the steps to build docker image using source code:
1. Clone this git repository
```console
$ git clone https://github.com/dbsentry/ssh-docker.git
```
2. By default Makefile creates image as dbsentry/sshfp. To change, modify Makefile
3. Change .release to reflect correct tag on docker image
4. Run build
```console
$ docker build -t sshd . -f Dockerfile
```
The generated image when run would start a docker container with all the services.

## Run
You can use either docker or podman to run this container.
```console
$ docker run --hostname mavrix2 -p2022:22 -d -it localhost/sshd
```

```console
$ podman run --hostname mavrix2 -p2022:22 -d -it localhost/sshd
```

## License
All assets and code are under the GNU GPL LICENSE and in the public domain unless specified otherwise.

Some files were sourced from other open source projects and are under their terms and license.
