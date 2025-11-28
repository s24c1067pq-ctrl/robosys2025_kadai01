#!/bin/bash
# SPDX-FileCopyrightText: 2025 shintomi tomoya 　　　　　
# SPDX-License-Identifier: BSD-3-Claus

set -e  

echo "=== Running addwww tests ==="


result=$(echo "草" | ./addwww)

if [ "$result" = "草ｗｗｗ" ]; then
    echo "OK: "
else
    echo "FAIL: "
    echo "結果: $result"
    exit 1
fi

echo "ALL TESTS PASSED"

