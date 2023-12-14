# Description

## Links to previous PRs

(Insert here)

## Rules
All previous genesis validators should name their PRs "Update {validator_alias}.toml" and provide links to previous PRs merged. 

All new validators should name their PRs "Create {validator_alias}.toml" and provide links to their previously closed PRs, if any.

## Checklist before merging

- [ ] Only one toml is added in this PR
- [ ] The file being added has no special characters in its name (no '.' or ' ')
- [ ] The file being added is indeed a .toml file
- [ ] The toml being added is to the correct folder, and only to the correct folder
- [ ] The `eth_hot_key` and `eth_cold_key` are present
- [ ] The `email` is present
