# metal2
puppet repo for setting up stuff

- check -- `bolt plan run kick --nodes hel1`
- kick -- `bolt plan run kick --nodes hel1 noop=false`
- sync modules **(deletes unknown stuff from modules)** -- `bolt puppetfile install`
