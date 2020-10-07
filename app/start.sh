#!/usr/bin/env bash


PATH=/usr/src/app/firmware/firmata-
RELEASE_PATH=https://github.com/balena-io/balena-fin-coprocessor-firmata/releases/download/

if [[ ! -z $FW_VERSION ]]
    then
        FILEPATH="${PATH}${FW_VERSION}"
        if test -f $FILEPATH
            then
                echo "Firmware already downloaded. Skipping."
            else
                echo "Need to download firmware version $FW_VERSION"
                FULL_PATH="${RELEASE_PATH}v${FW_VERSION}/firmata.hex"
                echo "${FULL_PATH}"
                /usr/bin/wget ${FULL_PATH} -o "${FILEPATH}"
        fi
fi

node index.js