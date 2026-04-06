#!/usr/bin/env sh
# Install the welcome scripts and wire them into Zsh startup.

set -eu

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST_DIR="${HOME}/.local/bin"
ZSHRC_PATH="${HOME}/.zshrc"

PRIMARY_SCRIPT="zsh_welcome.sh"
FALLBACK_SCRIPT="welcome.sh"

PRIMARY_SOURCE_PATH="${SRC_DIR}/${PRIMARY_SCRIPT}"
FALLBACK_SOURCE_PATH="${SRC_DIR}/${FALLBACK_SCRIPT}"
PRIMARY_DEST_PATH="${DEST_DIR}/${PRIMARY_SCRIPT}"
FALLBACK_DEST_PATH="${DEST_DIR}/${FALLBACK_SCRIPT}"

BEGIN_MARKER="# >>> zsh-ai-agent-welcome-message >>>"
END_MARKER="# <<< zsh-ai-agent-welcome-message <<<"
TEMP_PATH="${ZSHRC_PATH}.tmp.$$"

require_file() {
	if [ ! -f "$1" ]; then
		echo "Error: $1 not found." >&2
		exit 1
	fi
}

install_script() {
	source_path="$1"
	dest_path="$2"

	cp "$source_path" "$dest_path"
	chmod 755 "$dest_path"
}

append_block() {
	cat >>"$ZSHRC_PATH" <<EOF
${BEGIN_MARKER}
if [ -x "\$HOME/.local/bin/${PRIMARY_SCRIPT}" ]; then
  "\$HOME/.local/bin/${PRIMARY_SCRIPT}"
elif [ -x "\$HOME/.local/bin/${FALLBACK_SCRIPT}" ]; then
  "\$HOME/.local/bin/${FALLBACK_SCRIPT}"
fi
${END_MARKER}
EOF
}

rewrite_zshrc_without_old_block() {
	awk -v begin="$BEGIN_MARKER" -v end="$END_MARKER" '
    $0 == begin { skip = 1; next }
    $0 == end { skip = 0; next }
    skip != 1 { print }
  ' "$ZSHRC_PATH" >"$TEMP_PATH"
	mv "$TEMP_PATH" "$ZSHRC_PATH"
}

require_file "$PRIMARY_SOURCE_PATH"
require_file "$FALLBACK_SOURCE_PATH"

mkdir -p "$DEST_DIR"
install_script "$PRIMARY_SOURCE_PATH" "$PRIMARY_DEST_PATH"
install_script "$FALLBACK_SOURCE_PATH" "$FALLBACK_DEST_PATH"

touch "$ZSHRC_PATH"

rewrite_zshrc_without_old_block
append_block

echo "Installed ${PRIMARY_SCRIPT} to ${PRIMARY_DEST_PATH}."
echo "Installed ${FALLBACK_SCRIPT} to ${FALLBACK_DEST_PATH}."
echo "Updated ${ZSHRC_PATH} to run ${PRIMARY_SCRIPT} with a ${FALLBACK_SCRIPT} fallback."
