#!/usr/bin/env bash
set -x
set -v
cp registry.yaml /usr/local/metabase
cd /usr/local/metabase
git config --global --add safe.directory $PWD

echo DRIVER IS $DRIVER
pwd

yq  -r -M  ".drivers[] | select(.name==\"${DRIVER}\") | .git.default.url" registry.yaml | xargs -I {} git clone {} "metabase/modules/drivers/${DRIVER}"

op item list --format=json |\
  jq -r ".[] | select(.title==\"driver: $DRIVER\") | .id" |\
  xargs -I {} op item get {} --format=json --vault "Driver Development" |\
  jq -r ".fields[] | select(.section.label == \"ENV\") | \"MB_$(echo $DRIVER | tr '[:lower:]' '[:upper:]' | tr '-' '_')_TEST_\\(.label)='\\(.value)'\"" > driver.env

set -a
source driver.env
set +a

cd metabase
git checkout master
git pull > /dev/null
git status
ls
ls modules/drivers/

DRIVERS=$DRIVER clojure  \
  -Sdeps "{:jvm-opts [\"-Dci=true\" \"-Xmx4g\" \"-Xms4g\"] :aliases {:partner-driver {:extra-paths [\"modules/drivers/${DRIVER}/test\" \"modules/driver/${DRIVER}/src\"] :extra-deps {metabase/${DRIVER} {:local/root \"modules/drivers/${DRIVER}\"}}}}}" \
  -X:dev:ee:ee-dev:drivers:drivers-dev:partner-driver:test \
  :only-tags [:mb/driver-tests] \
  :only 'metabase.driver.sql-jdbc-test'
