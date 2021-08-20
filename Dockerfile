# the brendan gregg stack
# strace strace
# opensnoop 
# lsof lsof
# fatrace fatrace
# filelife
# pcstat
# perf linux-tools-common
# ftrace 
# lttng
# bcc bcc
# bpftrace bpftrace
# ext4dist
# ext4slower
# btrsslower
# nfsslower
# xfsslower
# iostat sysstat
# biosnoop
# biolatency
# blkstrace
# mdflush
# tiptop tiptop
# lstrace
# ss iproute2
# nstat iproute2
# tcplife
# tcpretrans
# udpconnect
# nicstat nicstat
# netstat
# ip
# hardirqs
# criticalstat
# numastat numactl
# free procps
# slasbtop
# vmstat procps
# pidstat sysstat
# ps procps
# top procps
# atop atop
# softirqs
# offcputime
# runqlen
# profile
# mpstat sysstat
# execsnoop
# gethostlatency
# sar
# dmesg util-linux
# dstat dstat
# turbostat linux-tools-common
# showboost
# rdmsr msr-tools
# swapon mount
# ethtool ethtool
# snmpget snmp
# lldptool lldpad
# tcpdump tcpdump
# dtrace systemtap-sdt-dev


# should use a sha256 here but for some reason alpine 3.14.1 segfaults docker when i try it
FROM alpine:latest

# there are images out there with aws-cli, some on alpine
# some even have curl, but not jq, some have all of them,
# but not running bash (which i need to keep things tidy)
# so i had to come up with my own "aws-ready" container
# with which i can run non-trivial scripts using all that
RUN apk --update-cache --upgrade --verbose add bash less vim curl jq coreutils aws-cli && rm -rf /var/cache/apk/*

WORKDIR /tmp
