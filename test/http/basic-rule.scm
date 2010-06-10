#!r6rs

(import (rnrs (6))
        (http basic-rule)
        (http assertion)
        (xunit))

(assert-parsing-successfully token "foo")
(assert-parsing-successfully token "This_is_a-t0ken")

(assert-parsing-successfully ctext "a" '(ctext #\a))
(assert-parsing-successfully ctext "\r\n " '(32) '(ctext #\space))
(assert-parsing-successfully ctext "\r\n \t" '(32) '(ctext #\space))
(assert-parsing-successfully ctext "\r\n\t " '(9) '(ctext #\tab))

(assert-parsing-successfully quoted-pair "\\a" '(quoted-pair #\a))
(assert-parsing-successfully quoted-pair "\\\\" '(quoted-pair #\\))
(assert-parsing-successfully quoted-pair "\\\"" '(quoted-pair #\"))

(assert-parsing-successfully comment "()" '(comment))
(assert-parsing-successfully comment "(foo)" '(comment (ctext #\f) (ctext #\o) (ctext #\o)))
(assert-parsing-successfully comment "(\\(\\))" '(comment (quoted-pair #\() (quoted-pair #\))))
(assert-parsing-successfully comment "(())" '(comment (comment)))

(assert-parsing-successfully quoted-string "\"\\\"\\\"\"" '(#\" ((quoted-pair #\") (quoted-pair #\")) #\"))

(report)
