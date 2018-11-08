# About project

This is a custom container that will authorize users based on their SSH private key. The key whitelist is built by listing all users that belong to a certain github organisation. 

You need to supply Github API Personal access token that will be used to get the list of organisation users. The access can be read only, following permissions are sufficient for the task: `public_repo, read:org, read:public_key, repo:status`.

# Configuration

Provide following environment variables for the container
 - GITAUTH_API_TOKEN
 - GITAUTH_REPOSITORY_URL
 - GITAUTH_HOST (optional if `GITAUTH_REPOSITORY_URL` is defined) 
 - GITAUTH_ORGANISATION (optional if `GITAUTH_REPOSITORY_URL` is defined)

# Caching

To make the login process faster, the script does cache the member list for 1 hour and user keys for 24 hours.
