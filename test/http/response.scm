#!r6rs

(import (rnrs (6))
        (http response)
        (http assertion)
        (xunit))

(assert-parsing-successfully Response
                             (string-append "HTTP/1.1 200 OK\r\n"
                                            "\r\n"
                                            "This is a successful response.")
                             '((((#\H #\T #\T #\P #\/) (#\1) #\. (#\1)) #\space (#\2 #\0 #\0) #\space ((ctext #\O) (ctext #\K)) (#\return #\linefeed))
                               ()
                               (#\return #\linefeed)
                               ((#\T #\h #\i #\s #\space #\i #\s #\space #\a #\space #\s #\u #\c #\c #\e #\s #\s #\f #\u #\l #\space #\r #\e #\s #\p #\o #\n #\s #\e #\.))))

(report)
