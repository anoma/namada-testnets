[[established_account]]
vp = "vp_user"
threshold = 1
public_keys = ["tpknam1qrgjyy7t80rd5dw3tgccg9yqpmknnu7vgtr2qaz8jajf3texp4tyq907wnt"]

[[validator_account]]
address = "tnam1qyafjlgmrlkt8256vqnhqxklvmraz63veuqzxajt"
vp = "vp_user"
commission_rate = "0.05"
max_commission_rate_change = "0.01"
net_address = "65.109.82.106:26656"

[validator_account.consensus_key]
pk = "tpknam1qqr7rh3pycxjkukr720fwh64ul2eva44m6pt8f04txnwxf4uv3feyp7fpm9"
authorization = "signam1qqj87mcalyhglekml7ltzr0tkrd9fz3jgrzm7kp8p08kas8sfdqjcll4jm7c222mkk9825u9c73fktqrxkageavkdmnqvf0p4cpc27cr82u2yg"

[validator_account.protocol_key]
pk = "tpknam1qpyxj5qp0unc8axc5jm9gz7f6hlyfqf8npxd5ssmak8a22agu67mxgx94fl"
authorization = "signam1qqwa4rlrms7j9cf23tyer06ku4l6p6j4l5kvu2t7fz40u4hffq9r5sayf7e2vha9xzem8gulde8krr7rc26j3klkfcl0z4n8uwg98ggtw08v96"

[validator_account.tendermint_node_key]
pk = "tpknam1qqzntxulua9ptv7ujd4kz9vh4legfxhc2d5c7629c28gnqveaqnq59lzzsx"
authorization = "signam1qp8unmlgjt3mldtqy8fq8r5sr7cl504c4e7hn6wjaexfjdvdfhrw0zr5kwg60nry8meunpsy6wndjfmgqlvm9qm0evthxpmutnnx05cf60x8fw"

[validator_account.eth_hot_key]
pk = "tpknam1qypm0rxwdhq57pf9pme4zrjdr53x8ekt757kp6dp7v4udrwzvu9c5as8afjck"
authorization = "signam1qx0dcxzrwzlueghyvwe4jctsqwe8umasd95sdtkxdqn5ym5006nh5rcxpxevc34wuvqfcxnnwkcdz78z8nafp6d8vghlxn3zv0m74znmqy5nsv8d"

[validator_account.eth_cold_key]
pk = "tpknam1qyp0zjvcx25tpwtzmmtqtvtdmnsr4fxaxwf297fgfsed8gct8jrkrmszvc593"
authorization = "signam1qx8tle35flfmktl4uq67qe0wyksqn3q9lx7mjhyfzwfv8f2xm68scl4hv72zqfmqhz8z5x245430qp44dpnlywfmshypxdfjrq6y89c3qyhmapjq"

[validator_account.metadata]
email = "kuatcapital@gmail.com"
discord = "2xstake.com"
elements = "@kuatcapital:matrix.org"
telegram = "@x2Stakecom"
twitter = "@2xStake"
  
[validator_account.signatures]
tpknam1qrgjyy7t80rd5dw3tgccg9yqpmknnu7vgtr2qaz8jajf3texp4tyq907wnt = "signam1qq5u7n2253k697p7f6kpn8ee90ssdnxdnyq8z6h5jz3nt8yht5lg07xrtp5z9aw4g8kfe3whfdfps3gddc3e4jaf76rq9usl7xtfvkgf66jvmw"

[[bond]]
source = "tnam1qyafjlgmrlkt8256vqnhqxklvmraz63veuqzxajt"
validator = "tnam1qyafjlgmrlkt8256vqnhqxklvmraz63veuqzxajt"
amount = "1000000"

[bond.signatures]
tpknam1qrgjyy7t80rd5dw3tgccg9yqpmknnu7vgtr2qaz8jajf3texp4tyq907wnt = "signam1qzsek77rypptsvw2jl46l40ghr97xah02f9l4z396feul7fe7ea2d9cj3yn5zd97hh9rhsyz28vle4d894sztekglpzd520an5mfessy4um6qc"
