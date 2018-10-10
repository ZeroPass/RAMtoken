#!/bin/bash
TX_TTL=${TX_TTL:-"300"} # 5min
CLEOS=${CLEOS:-"cleos"}

########################################################################

function print_help {
    echo "This script inits RAM exchange contract."
    echo -e "\nUsage: <exchange_account> <fee_recipient>"
}

# Check num param
if [ "$#" -lt 2 ]; then
    print_help
    exit 1
fi

# Parse args
EXCHANGE_ACCOUNT=$1
FEE_RECIPIENT=$2

# Create exchange
echo "Creating RAM token exchange for the account '$EXCHANGE_ACCOUNT' with fee recipient '$FEE_RECIPIENT' ..."
RESULT=$($CLEOS push action -x$TX_TTL $EXCHANGE_ACCOUNT init '["'$FEE_RECIPIENT'"]' -p $EXCHANGE_ACCOUNT@active 2>&1)
rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi

# Add eosio.code permissio
echo "Adding 'eosio.code' permission to the active authority of $EXCHANGE_ACCOUNT"
echo -e "\nEnter '$EXCHANGE_ACCOUNT' active permission public key: "
read ACTIVE_PUB_KEY

RESULT=$($CLEOS set 'account permission' $EXCHANGE_ACCOUNT active '{"threshold": 1,"keys": [{"key": "'$ACTIVE_PUB_KEY'","weight": 1}],"accounts": [{"permission":{"actor":"'$EXCHANGE_ACCOUNT'","permission":"eosio.code"},"weight":1}]}' owner -p $EXCHANGE_ACCOUNT@owner 2>&1)
rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi

# Setup admin permissions
set_admin_action() {
    RESULT=$($CLEOS set 'action permission' $EXCHANGE_ACCOUNT $EXCHANGE_ACCOUNT $1 admin 2>&1)
    rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi
}

echo "Adding new authority 'admin' to the account '$EXCHANGE_ACCOUNT'"
echo -e "\nEnter '$EXCHANGE_ACCOUNT' admin permission public key: "
read ADMIN_PUB_KEY

RESULT=$($CLEOS set 'account permission' $EXCHANGE_ACCOUNT admin '{"threshold": 1,"keys": [{"key": "'$ADMIN_PUB_KEY'","weight": 1}]}' owner -p $EXCHANGE_ACCOUNT@owner 2>&1)
rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi

set_admin_action "start"
set_admin_action "stop"
set_admin_action "clrorders"
set_admin_action "setproxy"
set_admin_action "setfeerecip"

# Success
echo "RAM token exchange was successfully initialized!"