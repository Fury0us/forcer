# forcer
Login page Brute forcer that can use Hydra and Burpsuite in conjunction
## Installation
git clone https://github.com/fury0us/forcer
## Usage
Usage: forcer.sh [options] <url> <username_list> <password_list>
##
Options:
##
  -h, --help      Show this help message and exit
  -v, --version   Show version information and exit
  -b, --burp      Use Burp Suite to brute-force the login page
  -H, --hydra     Use Hydra to brute-force the login page
##
Required arguments:
##
  <url>           The URL of the login page
  <username_list> The username list to use for the brute-force attack
  <password_list> The password list to use for the brute-force attack
##
Description:
##
  This script uses Hydra and/or Burp Suite to brute-force a login page.
##
  forcer.sh -b -H http://example.com/login usernames.txt passwords.txt
