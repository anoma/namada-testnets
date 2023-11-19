# Description

All previous genesis validators should name their PRs "Update {validator_alias}.toml for tesntet-15" and provide links to previous PRs merged.

## If this is an UPDATE for a previous genesis validator

Checks are made against your `net_address`. If this has changed since the previous testnet, make sure you provide links of previous prs merged from your previous git username.

Thanks in advance!

## Checklist before merging

- [ ] Only one toml is added in this PR
- [ ] The file being added is indeed a .toml file
- [ ] The toml being added is to the correct folder, and only to the correct folder
- [ ] The `eth_hot_key` and `eth_cold_key` are present
- [ ] The `email`, `discord`, `elements` `telegram`, and `twitter` fields are present and valid
