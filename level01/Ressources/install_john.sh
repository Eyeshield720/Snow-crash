#!/bin/bash

curl -Ok https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.xz && tar xJf john-*.tar.xz
rm -f john-*.tar.xz
cd john-*-1/src/
./configure && make -s clean && make -sj4
./../run/john ../../passwd
