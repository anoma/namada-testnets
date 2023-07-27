import socket
import argparse
import os
import toml
from typing import Dict

def is_valid_pregenesis_file(data: Dict) -> bool:
    validator_alias = list(data['validator'].keys())[0]
    validator_data = data['validator'][validator_alias]

    if not _are_all_keys_present(validator_data):
        print("Not all keys are present")
        return False
    if not _is_valid_ip(validator_data['net_address']):
        print("Invalid net address")
        return False
    if not _are_values_strings(validator_data):
        print("Not all values are strings")
        return False
    if not _is_commission_rate_valid(validator_data):
        print("Invalid commission rate")
        return False
    if not _is_max_commission_rate_change_valid(validator_data):
        print("Invalid max commission rate change")
        return False
    return True

def _are_all_keys_present(data: Dict) -> bool:
    keys = {"consensus_public_key", "eth_hot_key", "eth_cold_key", "account_public_key", "protocol_public_key", "dkg_public_key", "commission_rate",
            "max_commission_rate_change", "net_address", "tendermint_node_key"}
    # Checks if all keys are present
    return len(keys.difference(data.keys())) == 0

def _is_valid_ip(addr: str) -> bool:
    try:
        ip, port = addr.split(':')
        socket.inet_aton(ip)
        return True
    except socket.error:
        return False

def _are_values_strings(data : Dict) -> bool:
    # Checks if all values are strings
    for value in data.values():
        if not isinstance(value, str):
            return False
    return True    

def _is_commission_rate_valid(data : Dict) -> bool:
    # Checks if commission rate is valid
    commission_rate = float(data['commission_rate'])
    return commission_rate >= 0 and commission_rate <= 1

def _is_max_commission_rate_change_valid(data : Dict):
    # Checks if max commission rate change is valid
    max_commission_rate_change = float(data['max_commission_rate_change'])
    return max_commission_rate_change >= 0 and max_commission_rate_change <= 1

def main(args):
    dir_name = args.folder
    filenames = os.listdir(dir_name)
    is_correct = True
    total_pregenesis_files = 0

    for filename in filenames:
        if filename.endswith(".toml"):
            total_pregenesis_files += 1
            data = toml.load(os.path.join(dir_name, filename))
            if not is_valid_pregenesis_file(data):
                print("Invalid pregenesis file: " + filename)
                is_correct = False
        else:
            print("Invalid file: " + filename + " (not a toml file)")
            is_correct = False

    print("Checked {} files.".format(total_pregenesis_files))
    if is_correct:
        print("All pregenesis files are valid")
        exit(0)
    else:
        print("Not all pregenesis files are valid")
        exit(1)



if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='NamadaValidatePregenesis', description='Validates all pregenesis tomls')
    parser.add_argument('--folder', help='The name of the directory to validate.', default="namada-mainnet")
    args = parser.parse_args()

    main(args)


