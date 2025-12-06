# email_mux.cr
Web-API for [emailmux.com](https://emailmux.com) temporary Gmail, Outlook, and Hotmail addresses instantly. Use free, disposable, anonymous email to stay safe from spam

## Example
```cr
require "./email_mux"

email_mux = EmailMux.new
email = email_mux.generate_email()
puts email
```
