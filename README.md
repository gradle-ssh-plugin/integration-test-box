# SSH server for integration test

An image with OpenSSH server for OS integration test of Gradle SSH Plugin and Groovy SSH.


## How to Use

Run a container of the image.

```sh
docker run -d -e authorized_key='ssh-rsa ...' -p 8022:22 integration-test-box
```

