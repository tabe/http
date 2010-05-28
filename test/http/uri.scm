#!r6rs

(import (rnrs (6))
        (http uri)
        (http assertion)
        (xunit))

(assert-parsing-successfully URI
                             "http://fixedpoint.jp/"
                             '((#\h (#\t #\t #\p)) #\: ((#\/ #\/) (() (#\f #\i #\x #\e #\d #\p #\o #\i #\n #\t #\. #\j #\p) ()) ((#\/ ()))) () ())
                             )
(assert-parsing-successfully URI
                             "http://foo@www.example.com:80/??#/"
                             '((#\h (#\t #\t #\p)) #\: ((#\/ #\/) ((((#\f #\o #\o) #\@)) (#\w #\w #\w #\. #\e #\x #\a #\m #\p #\l #\e #\. #\c #\o #\m) ((#\: (#\8 #\0)))) ((#\/ ()))) ((#\? (#\?))) ((#\# (#\/))))
                             )

(assert-parsing-successfully absolute-URI
                             "http://fixedpoint.jp/"
                             '((#\h (#\t #\t #\p)) #\: ((#\/ #\/) (() (#\f #\i #\x #\e #\d #\p #\o #\i #\n #\t #\. #\j #\p) ()) ((#\/ ()))) ())
                             )
(assert-parsing-successfully absolute-URI
                             "http://foo@www.example.com:80/??"
                             '((#\h (#\t #\t #\p)) #\: ((#\/ #\/) ((((#\f #\o #\o) #\@)) (#\w #\w #\w #\. #\e #\x #\a #\m #\p #\l #\e #\. #\c #\o #\m) ((#\: (#\8 #\0)))) ((#\/ ()))) ((#\? (#\?))))
                             )

(assert-parsing-successfully relativeURI
                             "//www.example.com?q=relative"
                             '(((#\/ #\/) (() (#\w #\w #\w #\. #\e #\x #\a #\m #\p #\l #\e #\. #\c #\o #\m) ()) ())
                               ((#\? (#\q #\= #\r #\e #\l #\a #\t #\i #\v #\e)))
                               ))
(assert-parsing-successfully relativeURI
                             "/foo"
                             '((#\/ (((#\f #\o #\o) ())))
                               ()
                               ))

(report)
