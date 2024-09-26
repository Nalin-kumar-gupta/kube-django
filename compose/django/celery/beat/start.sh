#!/bin/bash

set -o errexit
set -o nounset

rm -f './celerybeat.pid'
celery -A server_k8s beat -l INFO
