#!/bin/sh
m4 --define=_md5sum=.platform/md5.`uname` --define=_private_key="$1" platform.m4 > platform.mk
