#!/bin/bash

set -o errexit
set -o nounset

watchfiles --filter python 'celery -A server_k8s worker --loglevel=info'
