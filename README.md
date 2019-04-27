I made this function due to needs of generating a random password.

I was unable to find documentation for an API at http://correcthorsebatterystaple.net/,
so I kept looking and found http://getanewpassword.com/api/generatepassword, which does support REST API.

Note: http://getanewpassword.com does not support POST, even though it says it does on the front page.

## Issues
* Does not seem to work in PowerShell 5.1 using certian buggy versions of .NET.
  * I think this is the related issue, but not sure because it's old: https://github.com/PowerShell/PowerShell/issues/2054
* However, it DOES work in PowerShell Core (6.1), Postman, etc... :)