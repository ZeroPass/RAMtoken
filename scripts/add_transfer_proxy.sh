#!/bin/bash
TX_TTL=${TX_TTL:-"300"} # 5 min
CLEOS=${CLEOS:-"cleos"}

########################################################################

function print_help {
    echo "This script registers ram exchange with transfer proxy contract."
    echo -e "\nUsage: <ram_exchange_account><proxy_contract>"
}

# Check num param
if [ "$#" -lt 2 ]; then
    print_help
    exit 1
fi

# Parse args
ACCOUNT=$1
PROXY=$2

ABI_ACTION_SIGNUP="signup"
ABI_ACTION_SETUP_PROXY="setproxy"

# Signup account with proxy
echo "Signing up '$ACCOUNT' with proxy '$PROXY' ..."
RESULT=$($CLEOS push action -x$TX_TTL $PROXY $ABI_ACTION_SIGNUP '["'$ACCOUNT'"]' -p $ACCOUNT@active 2>&1)
rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi

# Add proxy to contract
RESULT=$($CLEOS push action -x$TX_TTL $ACCOUNT $ABI_ACTION_SETUP_PROXY '["'$PROXY'"]' -p $ACCOUNT@owner 2>&1)
rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi

# Add permissions to account
echo "Adding '$PROXY@eosio.code' permission to $ACCOUNT ..."
ACCOUNT_PROXY_PERM='{"permission":{"actor":"'$PROXY'","permission":"eosio.code"},"weight":1}';
N_PERMS=$((N_PERMS+1))

if type "jqt" > /dev/null 2>&1 ; then
    if [[ $N_PERMS > 0 ]] ; then
        ACTIVE_PERM=$($CLEOS get account -j tranproxytst 2>&1)
        rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi
        ACTIVE_PERM=$(jq -n "$ACTIVE_PERM" | jq '.permissions[] | select(.perm_name == "active") | .required_auth' 2>&1)

        if [[ -z $ACTIVE_PERM ]] ; then
            echo "Error: No active permission level found on account '$ACCOUNT'!"
            exit 1
        fi

        if [[ -z $(jq -n "$ACTIVE_PERM" | jq '.accounts[] | select(.permission.actor == "'$PROXY'")' 2>&1) ]] ; then
            NEW_ACTIVE_PERMS=$(jq -n "$ACTIVE_PERM" | jq \
                '.accounts += [{"permission":{"actor":"'$PROXY'","permission":"eosio.code"},"weight":1}] |
                 .accounts = (.accounts | sort_by(.permission.actor))'  2>&1)
        fi
    fi
else # fallback
    echo "Adding '$ACCOUNT@eosio.code' permission to $ACCOUNT ..."
    ACCOUNT_CODE_PERM='{"permission":{"actor":"'$ACCOUNT'","permission":"eosio.code"},"weight":1}';
    N_PERMS=$((N_PERMS+1))

    if [[ $N_PERMS > 0 ]]; then
        echo -e "\nEnter '$ACCOUNT' active authority public key: "
        read PUB_KEY

        ACNT_1=$ACCOUNT_CODE_PERM
        ACNT_2=$ACCOUNT_PROXY_PERM
        if [[ "$ACNT_1" > "$ACNT_2" ]] ; then # sort
            ACNT_1=$ACCOUNT_PROXY_PERM
            ACNT_2=$ACCOUNT_CODE_PERM
        fi

        SEP=""; if [[ $N_PERMS == 2 ]]; then SEP=","; fi
        NEW_ACTIVE_PERMS='{"threshold": 1,"keys": [{"key": "'$PUB_KEY'","weight": 1}],
            "accounts": ['${ACNT_1}${SEP}${ACNT_2}']}'
    fi
fi

if [[ $NEW_ACTIVE_PERMS != "" ]] ; then
    RESULT=$($CLEOS set account permission $ACCOUNT active "$NEW_ACTIVE_PERMS" owner -p $ACCOUNT@active 2>&1)
    rc=$?; if [[ $rc != 0 ]]; then (1>&2 echo "$RESULT"); exit $rc; fi
fi

# Success
echo "Proxy was successfully setup!"
