# Purpose 

Collect the [orbs](https://github.com/CircleCI-Public/circleci-orbs#what-are-orbs) that are used throughout the snowdrop repos

## Instruction

### Prerequisites

- [Install](https://github.com/CircleCI-Public/circleci-cli/blob/master/README.md) the CircleCI CLI
- Obtain token from CircleCI dashboard (found under the user settings)
- Be an administrator of the snowdrop CircleCI organization

### Register a new orb with CircleCI

```bash
 circleci orb create snowdrop/openshift --token=xxxxx
```

###  Validate an orb

```bash
circleci orb validate openshift/orb.yml
```

### Publish an orb

To publish a dev version of an orb execute:

```bash
circleci orb publish openshift/orb.yml snowdrop/openshift@dev:master --token=xxxxx
```

To publish a prod version of an orb execute:

```
./release.sh <version> <CircleCI API token> <GitHub API token>
```
