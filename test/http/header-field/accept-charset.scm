#!r6rs

(import (rnrs (6))
        (http header-field accept-charset)
        (http assertion)
        (xunit))

(assert-parsing-successfully Accept-Charset
                             "Accept-Charset: iso-8859-5, unicode-1-1;q=0.8"
                             '((#\A #\c #\c #\e #\p #\t #\- #\C #\h #\a #\r #\s #\e #\t)
                               #\:
                               (((#\i #\s #\o #\- #\8 #\8 #\5 #\9 #\- #\5) ())
                                ((#\u #\n #\i #\c #\o #\d #\e #\- #\1 #\- #\1) ((#\; () #\q #\= (#\0 ((#\. (#\8)))))))))
                             )

(report)
