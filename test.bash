#!/bin/bash
# SPDX-FileCopyrightText: 2025 tomoya shintomi
# SPDX-License-Identifier: BSD-3-Clause

set -e

echo "=== 正常系テスト ==="

# 例1：1行
result=$(echo "草" | ./addwww)
if [ "$result" = "草ｗｗｗ" ]; then
    echo "PASS: 1行入力"
else
    echo "FAIL: 1行入力"
    exit 1
fi

# 例2：複数行
result=$(printf "今日は良い天気\n明日も晴れる\n" | ./addwww)
if [ "$result" = $'今日は良い天気ｗｗｗ\n明日も晴れるｗｗｗ' ]; then
    echo "PASS: 複数行入力"
else
    echo "FAIL: 複数行入力"
    exit 1
fi

# 例3：空行を含む
result=$(printf "一行目\n\n三行目\n" | ./addwww)
if [ "$result" = $'一行目ｗｗｗ\n\n三行目ｗｗｗ' ]; then
    echo "PASS: 空行を含む入力"
else
    echo "FAIL: 空行を含む入力"
    exit 1
fi

# 例4：空白を含む行
result=$(printf "これは テスト です\n" | ./addwww)
if [ "$result" = "これは テスト ですｗｗｗ" ]; then
    echo "PASS: 空白を含む行"
else
    echo "FAIL: 空白を含む行"
    exit 1
fi

echo "=== 異常系テスト ==="

# 例5：PDFを入力した場合（エラーになることを確認）
echo "PDF入力テスト（異常系）"

if cat output.pdf 2>/dev/null | ./addwww >/dev/null 2>&1; then
    echo "FAIL: PDF入力が通ってしまった（想定外）"
    exit 1
else
    echo "PASS: PDF入力はエラーになる（想定通り）"
fi

echo "ALL TESTS PASSED"
exit 0

