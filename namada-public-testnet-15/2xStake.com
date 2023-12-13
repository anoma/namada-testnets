[[established_account]]
vp = "vp_user"
threshold = 1
public_keys = ["tpknam1qzc3clglcy0tmvkqh248zr0kx7q6ckdfntj5atkaetk68zyk7rv3xnfg8gy"]

[[validator_account]]
address = "tnam1q8v3jlq565kn2amqxus3qxfj58z9zt4qxqqvt9vp"
vp = "vp_user"
commission_rate = "0.05"
max_commission_rate_change = "0.01"
net_address = "65.109.82.106:26656"

[validator_account.consensus_key]
pk = "tpknam1qpprutsqtf2vat8kvmgewvxe3kgf93xd73ar2q83z3l0vfthz0gyjz73zen"
authorization = "signam1qzgmql0z3l2d7w86xedux6kvedffp9czuz8atw9fzvngdafpgenezaw07ddrpyj54cpmf6x26gs2w6h4epq3k054h3ut0jqxr6ae4tcpf5raaq"

[validator_account.protocol_key]
pk = "tpknam1qzvzyrarhrl3gghzx3w0wvfhcdwvhaylzs90qa033a7dm7tp7qgcclrnnh2"
authorization = "signam1qq5rww4fwgcpwhk56n2wsrh5uc70zkyfj083hhs0sx2jz95sn9d6ds7809mt5gv9l55lynhn88068gvmxm000p5nxxplugy8kamqclsf8hzt8f"

[validator_account.tendermint_node_key]
pk = "tpknam1qza59k4dvze7nsgeazv3skfytc4fyv2z5shd7fz4ex07h9749yp92yt540r"
authorization = "signam1qrpk944juu7zqdljnuvjwglnxt2fqqg34wu3ve379ashpgwtjdpuqr6cy627xzpl8ruf9k6nm7nrc2t0u0ndx9sn258d5urtfrleqqqysng7nr"

[validator_account.eth_hot_key]
pk = "tpknam1qyp6g4jk32aqjs7mqdarhgrjc2ft8rhr9hf3glm85m8kr3r3mgmenpcgzte7q"
authorization = "signam1qx0j2hyvt3tcakwfj57kw8erru8p8vu3j98nwlqj6hlczm80yaszgzm24nr3hal8d2vjlq9zv9gqtasw8y9z4dcwk6w07qqx2yypmczsqqq3yt3c"

[validator_account.eth_cold_key]
pk = "tpknam1qyp0sz3uqt0a7xn7880zfgg6sc209wyaf64yse7pqftk9k2ggh5qjcs8zp28z"
authorization = "signam1q93qvelddayckn9s4hqpu8k3278arghmczv44zpxreer2fckn8p5jl4mhmnjl3pht4mh79yhw033jjgdhkp8j7nsez4747vxzg7akw4yqyr5zlk6"

[validator_account.metadata]
email = "kuatcapital@gmail.com"
discord_handle = "2xstake.com"

[validator_account.signatures]
tpknam1qzc3clglcy0tmvkqh248zr0kx7q6ckdfntj5atkaetk68zyk7rv3xnfg8gy = "signam1qz3rwyjnu2246selzum4qyfg755yu8ky58txlnsyx3qxt723rrl5uy84ekjftc7g8mdnh0f4y2kj4k49lcm27hltzrz2n8zvspdks4cdh3v22u"

[[bond]]
source = "tnam1q8v3jlq565kn2amqxus3qxfj58z9zt4qxqqvt9vp"
validator = "tnam1q8v3jlq565kn2amqxus3qxfj58z9zt4qxqqvt9vp"
amount = "1000000"

[bond.signatures]
tpknam1qzc3clglcy0tmvkqh248zr0kx7q6ckdfntj5atkaetk68zyk7rv3xnfg8gy = "signam1qrjvy0xwcspva58kf6s7v2q9vna4m0zc28eagzn3pk84klgxdtfw9k94kcnycpd8tpjhjur4a4wpwmwt4hvmyfpc9pglcx6d8azv87sdqr6p9d"
