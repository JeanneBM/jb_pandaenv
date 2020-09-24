# Historical Panda CI/CD lab — sanitized configuration

This repository preserves the Compose and Docker build examples from a historical lab. It does not include a configured Jenkins or Artifactory instance. Old images and service versions have not been validated for current use.

## Credential exposure response

Committed Jenkins/Artifactory runtime data, credentials, encryption keys, bootstrap passwords, logs, caches and workspaces have been removed from the current branch. Hard-coded Jenkins agent secrets were replaced with required local configuration. No credentials were decrypted.

**Previously published credentials must be treated as compromised.** Removing current files does not revoke tokens or remove earlier commits, forks, clones or caches. Revoke exposed GitHub/API tokens and rotate any affected passwords, Jenkins agent/admin credentials and Artifactory credentials/keys if the systems or accounts remain in use. Do not restore the old runtime directories. History cleanup and any GitHub cache cleanup are separate remaining tasks.

## Local configuration

1. Use a disposable local environment and review the old service images before running.
2. Create `.local/` and copy `.env.example` to `.local/lab.env` locally; keep it outside Git.
3. Initialize a NEW Jenkins instance and a dedicated agent, then set its NEW secret in that local file. Use fresh service volumes and configure their local ownership for your runtime.
4. Run `bash start.sh` only after reviewing configuration. Startup has not been tested as part of this sanitization.

The Compose agent connects to the Jenkins service over its internal lab network. Runtime state under `volumes/` and local credentials under `.local/` are ignored. Never force-add them. Git ignore rules do not remove data already present in Git history.
