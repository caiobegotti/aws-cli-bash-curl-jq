# the brendan gregg stack
# strace
# opensnoop
# lsof
# fatrace
# filelife
# pcstat
# perf
# ftrace
# lttng
# bcc
# bpftrace
# ext4dist
# ext4slower
# btrsslower
# nfsslower
# xfsslower
# xfsslower
# iostat
# biosnoop
# biolatency
# blkstrace
# mdflush
# tiptop
# lstrace
# ss
# nstat
# tcplife
# tcpretrans
# udpconnect
# nicstat
# netstat
# ip
# hardirqs
# criticalstat
# numastat
# free
# slasbtop
# vmstat
# pidstat
# ps
# top
# atop
# softirqs
# offcputime
# runqlen
# profile
# mpstat
# execsnoop
# gethostlatency
# sar
# dmesg
# dstat
# turbostat
# showboost
# rdmsr
# swapon
# ethtool
# snmpget
# lldptool
# tcpdump

# should use a sha256 here but for some reason alpine 3.14.1 segfaults docker when i try it
FROM alpine:latest

# there are images out there with aws-cli, some on alpine
# some even have curl, but not jq, some have all of them,
# but not running bash (which i need to keep things tidy)
# so i had to come up with my own "aws-ready" container
# with which i can run non-trivial scripts using all that
RUN apk --update-cache --upgrade --verbose add bash less vim curl jq coreutils aws-cli && rm -rf /var/cache/apk/*

WORKDIR /tmp
