#!/usr/bin/env bash

set -euo pipefail

cur=$(pwd)

bash $cur/keyboard.sh
bash $cur/modifiers.sh
bash $cur/function_keys.sh