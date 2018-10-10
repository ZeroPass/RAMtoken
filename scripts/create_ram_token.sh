#!/bin/bash
TX_TTL=${TX_TTL:-"300"} # 5min
CLEOS=${CLEOS:-"cleos"}

########################################################################

function print_help {
    echo "This script initialize RAM token contract."
    echo -e "\nUsage: <token_account> <token_issuer>"
}

# Check num param
if [ "$#" -lt 2 ]; then
    print_help
    exit 1
fi

# Parse args
TOKEN_ACCOUNT=$1
TOKEN_ISSUER=$2

# Create RAM token
echo "Creating RAM token up for account '$TOKEN_ACCOUNT' with issuer '$TOKEN_ISSUER' ..."
RESULT=$($CLEOS push action -x$TX_TTL $TOKEN_ACCOUNT create '["'$TOKEN_ISSUER'"]' -p $TOKEN_ACCOUNT@active 2>&1)
rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi

# Success
echo "RAM token was successfully created!"
