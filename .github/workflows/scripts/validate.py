import socket
import argparse
import os
import toml
from typing import Dict, Any

def is_valid_pregenesis_file(data: Dict) -> bool:
    for validator_data in data['validator_account']:
        if not _are_all_keys_present(validator_data):
            print("Not all keys are present")
            return False
        if "vp" not in validator_data:
            print("'vp' is missing")
            return False
        if not _is_valid_ip(validator_data.get('net_address', '')):
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
        if not _is_email_valid(validator_data):
            print("Invalid email")
            return False

    return True

def _are_all_keys_present(data: Dict) -> bool:
    required_keys = {"vp", "commission_rate", "max_commission_rate_change", "net_address", "consensus_key",
                     "protocol_key", "tendermint_node_key", "eth_hot_key", "eth_cold_key", "metadata", "signatures"}
    metadata_keys = {"email", "discord", "twitter", "elements"}

    for validator_data in data.get("validator_account", []):
        if not required_keys.issubset(validator_data.keys()):
            return False

        if "metadata" in validator_data and not metadata_keys.issubset(validator_data["metadata"].keys()):
            return False

    return True


def _is_valid_ip(addr: str) -> bool:
    try:
        ip, port = addr.split(':')
        socket.inet_aton(ip)
        return True
    except socket.error:
        return False


def _are_values_strings(data: Dict[str, Any]) -> bool:
    # Meant to be not strings
    excluded_keys = {"threshold", "public_keys"}

    def check_nested_values(nested_data: Dict[str, Any]) -> bool:
        for key, value in nested_data.items():
            if not isinstance(value, str):
                print(key)
                return False
            if isinstance(value, dict):
                # Recursively check nested values
                if not check_nested_values(value):
                    return False
        return True

    # Checks if all values (including nested values) are strings
    for key, value in data.items():
        if key not in excluded_keys and not isinstance(value, str):
            if isinstance(value, dict):
                # Check nested values
                if not check_nested_values(value):
                    return False
    return True


def _is_commission_rate_valid(data: Dict) -> bool:
    # Checks if commission rate is valid
    commission_rate = float(data['commission_rate'])
    return 0 <= commission_rate <= 1


def _is_max_commission_rate_change_valid(data: Dict) -> bool:
    # Checks if max commission rate change is valid
    max_commission_rate_change = float(data['max_commission_rate_change'])
    return 0 <= max_commission_rate_change <= 1


def _is_email_valid(data: Dict[str, Any]) -> bool:
    # Checks if email is valid, only if 'metadata' and 'email' keys are present
    metadata = data.get('metadata', {})
    email = metadata.get('email')
    return email is not None and '@' in email and '.' in email

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


