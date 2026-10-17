#!/usr/bin/env bash
set -Eeuo pipefail

URL="https://github.com/comprometeu/belzebu_cnc/raw/refs/heads/main/main"
APP_DIR="/opt/belzebu"
APP_BIN="$APP_DIR/main"
TEMP_FILE="$APP_DIR/main.download"
BACKUP_FILE="$APP_DIR/main.backup"

CONTAINER_NAME="belzebu"
PROCESS_NAME="main"

mkdir -p "$APP_DIR"
cd "$APP_DIR"

echo "[1/5] Downloading the latest version..."

curl --fail --silent --show-error --location \
  --connect-timeout 5 \
  --max-time 120 \
  "$URL" \
  --output "$TEMP_FILE"

if [[ ! -s "$TEMP_FILE" ]]; then
  echo "Error: The downloaded file is empty."
  rm -f "$TEMP_FILE"
  exit 1
fi

chmod +x "$TEMP_FILE"

echo "[2/5] Backing up the current version..."

if [[ -f "$APP_BIN" ]]; then
  cp -p "$APP_BIN" "$BACKUP_FILE"
  echo "Backup created: $BACKUP_FILE"
else
  echo "Warning: No existing main file was found."
fi

echo "[3/5] Replacing old binary..."

if docker ps --format '{{.Names}}' | grep -qx "$CONTAINER_NAME"; then
  echo "Stopping container: $CONTAINER_NAME"
  docker stop "$CONTAINER_NAME" >/dev/null
  RESTART_CONTAINER=1
else
  RESTART_CONTAINER=0
  if pgrep -x "$PROCESS_NAME" >/dev/null 2>&1; then
    echo "Killing running process: $PROCESS_NAME"
    pkill -x "$PROCESS_NAME" || true
    sleep 1
  fi
fi

mv -f "$TEMP_FILE" "$APP_BIN"
chmod +x "$APP_BIN"

echo "Installed: $APP_BIN"

echo "[4/5] Restarting..."

if [[ "$RESTART_CONTAINER" -eq 1 ]]; then
  docker start "$CONTAINER_NAME" >/dev/null
  echo "Container '$CONTAINER_NAME' restarted."
else
  nohup "$APP_BIN" >/dev/null 2>&1 &
  echo "Process started in background (PID $!)."
fi

echo "[5/5] Done."
echo "New version running."