#!/bin/bash

ACCOUNT="disla@google.com"
ROLE="roles/storage.objectViewer"
FULL_PROJECT=$(gcloud config list project --format "value(core.project)")

bind_account() {
	gcloud projects add-iam-policy-binding $FULL_PROJECT \
        --member user:$ACCOUNT --role $ROLE > /dev/null
}


PROMPT="Add $ACCOUNT to $ROLE in project $FULL_PROJECT?  "

while true; do
    read -p "$PROMPT" yn
    case $yn in
		[Yy]* ) bind_account && echo "ok"; break;;
        [Nn]* ) echo "Not Added";exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


