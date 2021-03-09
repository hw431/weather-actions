#!/bin/sh

set -eux

CITY=210046
LANGUAGE="zh-CN"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36"

curl \
  -H "Accept-Language: $LANGUAGE" \
  -H "User-Agent: $UA" \
  -LJo result.png \
  "wttr.in/~${CITY}_pF1.png"

WTTR_IMG=$( base64 result.png )

cat > result.md << EOF
## 今日天气

![result](data:image/png;base64,${WTTR_IMG})
EOF
