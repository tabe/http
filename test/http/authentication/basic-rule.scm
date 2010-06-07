#!r6rs

(import (rnrs (6))
        (http authentication basic-rule)
        (http assertion)
        (xunit))

(assert-parsing-successfully challenge
                             "Basic realm=\"WallyWorld\""
                             '((#\B #\a #\s #\i #\c)
                               (#\space)
                               (((#\r #\e #\a #\l #\m) #\= (#\" ((ctext #\W) (ctext #\a) (ctext #\l) (ctext #\l) (ctext #\y) (ctext #\W) (ctext #\o) (ctext #\r) (ctext #\l) (ctext #\d)) #\")))))

(assert-parsing-successfully credentials
                             "Foo bar"
                             '((#\F #\o #\o) (#\space) (#\b #\a #\r)))

(report)
