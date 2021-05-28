#!/bin/bash
rm -rf ./hits-by-image 2>/dev/null
mkdir ./hits-by-image 2>/dev/null
cat images | while read image;
do
    printable_name=$(echo $image | sed 's#[:/]#_#')
    echo "$(date +'%Y-%m-%d %H:%M:%S'): Start $image"
    docker build --quiet -t scan:$printable_name --build-arg IMAGE=$image ./docker
    docker run --rm -t scan:$printable_name | tee -a ./hits
    if [ "$(cat ./hits | wc -l)" -ne "0" ]; then
        mv ./hits ./hits-by-image/$printable_name
        echo "$(date +'%Y-%m-%d %H:%M:%S'): Finished found something $image"
    else
        rm ./hits
        docker image rm scan:$printable_name
        echo "$(date +'%Y-%m-%d %H:%M:%S'): Finished found nothing $image"
    fi
done