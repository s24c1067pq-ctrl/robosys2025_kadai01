#!/bin/bash
set -e

echo "=== 正常系テスト ==="

# 例1：1行
result=$(echo "草" | ./addwww)
echo "$result" | grep "草ｗｗｗ"
echo "PASS: 1行入力"

# 例2：複数行
result=$(printf "今日は良い天気\n明日も晴れる\n" | ./addwww)
echo "$result" | grep "今日は良い天気ｗｗｗ"
echo "$result" | grep "明日も晴れるｗｗｗ"
echo "PASS: 複数行"

# 例3：空行
result=$(printf "一行目\n\n三行目\n" | ./addwww)
echo "$result" | grep "一行目ｗｗｗ"
echo "$result" | grep "三行目ｗｗｗ"
echo "PASS: 空行対応"

echo "ALL TESTS PASSED"
exit 0

