# About project

This is a custom container that will authorize users based on their SSH private key. The key whitelist is provided by [SSH public keys for silta](https://github.com/wunderio/silta-ssh-keys) project.

Fingerprint keys are moved to a dedicated folder, `/etc/ssh/keys`, that can be mounted to a persistent storage.

# Configuration

Provide following environment variables for the container:
 - GITAUTH_URL: Endpoint providing ssh key list. f.ex. https://example.com/api/1/git-ssh-keys
 - GITAUTH_SCOPE: Scope you want to use for authorisation. f.ex. `https://github.com/organisation` or `git@github.com:organisation/reponame.git` for getting public keys of all `reponame` repository collaborators. 
 - GITAUTH_USERNAME: Key server credentials
 - GITAUTH_PASSWORD: Key server credentials
 - OUTSIDE_COLLABORATORS: Include outside collaborators f.ex. "true".

# Running

Build and run the docker image:
```
docker image build -t ssh-server .
docker run -p 2222:22 --env-file ./env.list -d ssh-server
```

Connect to ssh server
```
ssh www-admin@localhost -p 2222
```
