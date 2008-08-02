#!/bin/sh

./stdrun
./stdrun a
./stdrun -- a
./stdrun -- -a

./stdrun -a
./stdrun -a -b
./stdrun -ab
./stdrun -a -b -c
./stdrun -ab -c
./stdrun -abc
./stdrun -a -bc

./stdrun -x
./stdrun -x--
./stdrun -x --
./stdrun -x-- a
./stdrun -x -- a
./stdrun -x file
./stdrun -xfile
./stdrun -xa
./stdrun -xa -a
./stdrun -x a -a
./stdrun -xy
./stdrun -x -y
./stdrun -x -y -a
./stdrun -x "-a -b"
./stdrun -x "-- -a -b" -a
./stdrun -x "-- -a -b" -- -a

./stdrun "- "
./stdrun "-a -b"
