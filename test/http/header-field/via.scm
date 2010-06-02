#!r6rs

(import (rnrs (6))
        (http header-field via)
        (http assertion)
        (xunit))

(assert-parsing-successfully Via
                             "Via: 1.0 fred, 1.1 nowhere.com (Apache/1.1)"
                             `(,(string->list "Via")
                               #\:
                               (((() (#\1 #\. #\0)) (#\space) ((#\f #\r #\e #\d) ()) ())
                                ((() (#\1 #\. #\1)) (#\space) ((#\n #\o #\w #\h #\e #\r #\e #\. #\c #\o #\m) ()) (((#\space) (comment (ctext #\A) (ctext #\p) (ctext #\a) (ctext #\c) (ctext #\h) (ctext #\e) (ctext #\/) (ctext #\1) (ctext #\.) (ctext #\1))))))
                               ))
(assert-parsing-successfully Via
                             "Via: 1.0 ricky, 1.1 ethel, 1.1 fred, 1.0 lucy"
                             `(,(string->list "Via")
                               #\:
                               (((() (#\1 #\. #\0)) (#\space) ((#\r #\i #\c #\k #\y) ()) ())
                                ((() (#\1 #\. #\1)) (#\space) ((#\e #\t #\h #\e #\l) ()) ())
                                ((() (#\1 #\. #\1)) (#\space) ((#\f #\r #\e #\d) ()) ())
                                ((() (#\1 #\. #\0)) (#\space) ((#\l #\u #\c #\y) ()) ()))
                               ))
(assert-parsing-successfully Via
                             "Via: 1.0 ricky, 1.1 mertz, 1.0 lucy"
                             `(,(string->list "Via")
                               #\:
                               (((() (#\1 #\. #\0)) (#\space) ((#\r #\i #\c #\k #\y) ()) ())
                                ((() (#\1 #\. #\1)) (#\space) ((#\m #\e #\r #\t #\z) ()) ())
                                ((() (#\1 #\. #\0)) (#\space) ((#\l #\u #\c #\y) ()) ()))
                               ))

(report)
