#!/bin/bash
clamscan --recursive=yes --suppress-ok-results --no-summary --allmatch=yes --detect-pua=yes /toscan | \
    grep -v ": Symbolic link" | grep -v ": Empty file" | grep -v ": Sanesecurity.Foxhole.Zip_exe.UNOFFICIAL FOUND" | \
    grep -v "decompress file size exceeds limits"