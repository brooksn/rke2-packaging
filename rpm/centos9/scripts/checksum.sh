#!/bin/sh

directory="${DIRECTORY:-./}"
output_file="${OUTPUT_FILE:-sha256sum.txt}"

if command -v sha256sum >/dev/null 2>&1; then
    checksum_cmd="sha256sum"
elif command -v shasum >/dev/null 2>&1; then
    checksum_cmd="shasum -a 256"
else
    echo "checksum util not found"
    exit 1
fi

: >"$output_file"

for file in "$directory"*; do
    if [ -f "$file" ]; then
        $checksum_cmd "$file" | awk '{print $1 "  " $2}' >>"$output_file"
    fi
done

echo "Checksums written to $output_file"
./scripts2/checksum.sh
zsh: no such file or directory: ./scripts2/checksum.sh