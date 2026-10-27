#!/bin/bash
# AmberPM egg installer: PHP binaries with ext-rtc and the AmberPM phar
set -euo pipefail

apt-get update
apt-get install -y curl ca-certificates tar

mkdir -p /mnt/server
cd /mnt/server

if [[ "$(uname -m)" != "x86_64" ]]; then
	echo "AmberPM PHP binaries are only published for x86_64"
	exit 1
fi

PHP_TAG="${PHP_BINARIES_TAG:-amber-php-8.4.27-r3}"
PHP_FILE="PHP-8.4-Linux-x86_64-PM5.tar.gz"
PHP_BASE="https://github.com/Amber-PM/PHP-Binaries/releases/download/${PHP_TAG}"

echo "Downloading PHP binaries ${PHP_TAG}"
curl -fsSL -o "${PHP_FILE}" "${PHP_BASE}/${PHP_FILE}"
curl -fsSL -o SHA256SUMS.txt "${PHP_BASE}/SHA256SUMS.txt"
tr -d '\r' < SHA256SUMS.txt | grep " ${PHP_FILE}$" | sha256sum -c -
rm -rf bin
tar -xzf "${PHP_FILE}"
rm -f "${PHP_FILE}" SHA256SUMS.txt

if [[ "${AMBER_VERSION:-latest}" == "latest" ]]; then
	PHAR_URL="https://github.com/Amber-PM/Amber/releases/latest/download/PocketMine-MP.phar"
else
	PHAR_URL="https://github.com/Amber-PM/Amber/releases/download/${AMBER_VERSION}/PocketMine-MP.phar"
fi
echo "Downloading AmberPM ${AMBER_VERSION:-latest}"
curl -fsSL -o PocketMine-MP.phar "${PHAR_URL}"

./bin/php7/bin/php -r 'exit(extension_loaded("rtc") ? 0 : 1);' || { echo "ext-rtc is not loaded, NetherNet will not start"; exit 1; }
echo "AmberPM installed"
