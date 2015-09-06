#! /bin/bash

# Package all apache public stuff
tar -zcf package.tgz public_html

# Put the encrypted password as environment variable for ssh pass
export SSHPASS=$DEPLOY_PASS

# Send package.tgz and deploy.sh to server
sshpass -e scp -o stricthostkeychecking=no package.tgz $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
sshpass -e scp -o stricthostkeychecking=no deploy.sh $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH

# Run the deploy script
sshpass -e ssh -o stricthostkeychecking=no $DEPLOY_USER@$DEPLOY_HOST $DEPLOY_PATH/deploy.sh
