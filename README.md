# simple-container-scan

What does it do? It will download pack the image file-system content into a container with clamav
with allot of unofficial signatures and the run, the complete filesystem of the given container
with clamscan.

## run it 

To run it on the most popular containers just run the `get.popular.images.sh` first.
It will result in a `images` file in this directory.

Afterwards you can just run the `scan.sh` in the root of this repository.