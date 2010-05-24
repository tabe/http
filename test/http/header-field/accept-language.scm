#!r6rs

(import (rnrs (6))
        (http header-field accept-language)
        (http assertion)
        (xunit))

(assert-parsing-successfully Accept-Language
                             "Accept-Language: da, en-gb;q=0.8, en;q=0.7"
                             '((#\A #\c #\c #\e #\p #\t #\- #\L #\a #\n #\g #\u #\a #\g #\e)
                               #\:
                               ((((#\d #\a) ()) ())
                                (((#\e #\n) ((#\- (#\g #\b)))) ((#\; #\q #\= (#\0 ((#\. (#\8)))))))
                                (((#\e #\n) ()) ((#\; #\q #\= (#\0 ((#\. (#\7))))))))))

(report)
