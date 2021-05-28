#!/bin/bash
num_images=$1
echo "Getting the top $num_images images"
curl --silent "https://hub.docker.com/v2/repositories/library/?repositry_type=image&page=1&page_size=$num_images" | \
    jq -r '.results[] | .name+":latest"' > images
