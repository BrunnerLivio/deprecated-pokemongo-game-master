#!/bin/bash
## brief: wrapper script which calls trigger-travis
## If the branch name of the upstream and downstream project are equal and
## we have a valid travis configuration in the downstream project then
## try to trigger a travis build with the given github/travis user and
## the given github/travis access token and log a certain message in the
## travis downstream project build for tracing back the dependent builds

# arguments
USER=$1
DOWNSTREAM_REPO=$2
BRANCH=$3
TRAVIS_ACCESS_TOKEN=$4
MESSAGE=$6
CURRENT_BRANCH=$5

# fetch trigger-travis script and make executable
curl -LO "https://raw.githubusercontent.com/BrunnerLivio/pokemongo-game-master/${CURRENT_BRANCH}/bin/trigger-travis.sh"
chmod +x trigger-travis.sh

# check for correct input
#if [ $# -lt 4 ] ; then
 #  usage()
#fi

# trigger build if above conditions hold
#if [[ ($TRAVIS_BRANCH == $3) &&
if [[ ($TRAVIS_PULL_REQUEST == false) &&
   ( (! $TRAVIS_JOB_NUMBER == *.*) || ($TRAVIS_JOB_NUMBER == *.1) ) ]] ; then
   chmod +x trigger-travis.sh
   ./trigger-travis.sh $1 $2 $4 $3 $5
fi

# usage function
function usage {
   echo "$(basename $0): USER DOWNSTREAM_REPOSITORY BRANCH TRAVIS_ACCESS_TOKEN"
}