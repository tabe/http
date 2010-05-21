#!r6rs

(import (rnrs (6))
        (http header-field accept-encoding)
        (http assertion)
        (xunit))

(assert-parsing-successfully Accept-Encoding
                             "Accept-Encoding: compress, gzip"
                             '((#\A #\c #\c #\e #\p #\t #\- #\E #\n #\c #\o #\d #\i #\n #\g)
                               #\:
                               (((#\c #\o #\m #\p #\r #\e #\s #\s) ())
                                ((#\g #\z #\i #\p) ())))
                             )
;; (assert-parsing-successfully Accept-Encoding
;;                              "Accept-Encoding:"
;;                              )
(assert-parsing-successfully Accept-Encoding
                             "Accept-Encoding: *"
                             '((#\A #\c #\c #\e #\p #\t #\- #\E #\n #\c #\o #\d #\i #\n #\g)
                               #\:
                               (((#\*) ())))
                             )
(assert-parsing-successfully Accept-Encoding
                             "Accept-Encoding: compress;q=0.5, gzip;q=1.0"
                             '((#\A #\c #\c #\e #\p #\t #\- #\E #\n #\c #\o #\d #\i #\n #\g)
                               #\:
                               (((#\c #\o #\m #\p #\r #\e #\s #\s) ((#\; () #\q #\= (#\0 ((#\. (#\5)))))))
                                ((#\g #\z #\i #\p) ((#\; () #\q #\= (#\1 ((#\. (#\0)))))))))
                             )
(assert-parsing-successfully Accept-Encoding
                             "Accept-Encoding: gzip;q=1.0, identity; q=0.5, *;q=0"
                             '((#\A #\c #\c #\e #\p #\t #\- #\E #\n #\c #\o #\d #\i #\n #\g)
                               #\:
                               (((#\g #\z #\i #\p) ((#\; () #\q #\= (#\1 ((#\. (#\0)))))))
                                ((#\i #\d #\e #\n #\t #\i #\t #\y) ((#\; (#\space) #\q #\= (#\0 ((#\. (#\5)))))))
                                ((#\*) ((#\; () #\q #\= (#\0 ()))))))
                             )

(report)
