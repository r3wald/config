#!/bin/sh

# update cacert.pem (created by mozilla, extracted by curl)
# http://curl.haxx.se/docs/caextract.html

rm cacert.pem
wget http://curl.haxx.se/ca/cacert.pem

