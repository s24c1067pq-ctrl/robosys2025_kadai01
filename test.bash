#!/bin/bash
# SPDX-FileCopyrightText: 2025 tomoya shintomi
# SPDX-License-Identifier: BSD-3-Clause

set -e

echo "=== 正常系テスト ==="

# 例1：1行
result=$(echo "草" | ./addwww | tr -d '\r')
[ "$result" = "草ｗｗｗ" ]
echo "PASS: 1行入力"

# 例2：複数行
result=$(printf "今日は良い天気\n明日も晴れる\n" | ./addwww)
[ "$result" = $'今日は良い天気ｗｗｗ\n明日も晴れるｗｗｗ' ]
echo "PASS: 複数行"

# 例3：空行を含む
result=$(printf "一行目\n\n三行目\n" | ./addwww)
[ "$result" = $'一行目ｗｗｗ\n\n三行目ｗｗｗ' ]
echo "PASS: 空行"

# 例4：空白を含む行
result=$(printf "これは テスト です\n" | ./addwww)
[ "$result" = "これは テスト ですｗｗｗ" ]
echo "PASS: 空白あり"

echo "ALL TESTS PASSED"
exit 0

