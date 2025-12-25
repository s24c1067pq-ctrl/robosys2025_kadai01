#!/bin/bash
# SPDX-FileCopyrightText: 2025 shintomi tomoya 　　　　　
# SPDX-License-Identifier: BSD-3-Clause

set -e


result=$(echo "草" | ./addwww)

if [ "$result" = "草ｗｗｗ" ]; then
    echo "PASS: 標準入力テスト"
else
    echo "FAIL: 標準入力テスト"
    exit 1
fi

# 例2：複数行
result=$(printf "今日は良い天気\n明日も晴れる\n" | ./addwww)
[ "$result" = $'今日は良い天気ｗｗｗ\n明日も晴れるｗｗｗ' ]

# 例3：空行を含む
result=$(printf "一行目\n\n三行目\n" | ./addwww)
[ "$result" = $'一行目ｗｗｗ\n\n三行目ｗｗｗ' ]

# 例4：空白を含む行
result=$(printf "これは テスト です\n" | ./addwww)
[ "$result" = "これは テスト ですｗｗｗ" ]

echo "ALL TESTS PASSED"

