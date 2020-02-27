#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e57c62f056d53001a73506d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e57c62f056d53001a73506d
curl -s -X POST https://api.stackbit.com/project/5e57c62f056d53001a73506d/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e57c62f056d53001a73506d/webhook/build/publish > /dev/null
