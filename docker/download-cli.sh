#! /bin/sh

if [ -z "$VERSION" ]; then
  echo "download CLI failed: \$VERSION env var empty."
  exit 1
fi


echo "download CLI for version: $VERSION"

URL=$(curl -s https://api.github.com/repos/enricoschuetz/tmc/releases/tags/$VERSION | jq -r '.assets | .[] | select(.name == "tmc-linux-amd64") | .browser_download_url')

curl -OL $URL
mv ./tmc-linux-amd64 ./tmc
