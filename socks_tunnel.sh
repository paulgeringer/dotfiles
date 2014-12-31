#!/bin/bash

STATE=$1

set_socks_proxy() {
  sudo networksetup -setsocksfirewallproxy "Wi-Fi" 127.0.0.1 8080
}

toggle_socks_proxy() {
  sudo networksetup -setsocksfirewallproxystate "Wi-Fi" $1
}

get_bypass_list() {
  if [[ -e ~/.proxy_bypass_list ]]
  then
    echo $(cat ~/.proxy_bypass_list)
  else
    echo "*.localhost"
  fi
}

set_proxy_bypass() {
  sudo networksetup -setproxybypassdomains "Wi-Fi" $(get_bypass_list)
}

set_socks_proxy
toggle_socks_proxy $STATE
set_proxy_bypass

exit $?
