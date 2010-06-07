#!r6rs

(import (rnrs (6))
        (http request-line)
        (http assertion)
        (xunit))

(assert-parsing-successfully Request-Line
                             "GET / HTTP/1.0\r\n"
                             `(,(string->list "GET") #\space
                               (#\/ ()) #\space
                               ((#\H #\T #\T #\P #\/) (#\1) #\. (#\0)) (#\return #\linefeed)))
(assert-parsing-successfully Request-Line
                             "POST /foo/bar.html HTTP/1.1\r\n"
                             `(,(string->list "POST") #\space
                               (#\/ (((#\f #\o #\o) ((#\/ (#\b #\a #\r #\. #\h #\t #\m #\l)))))) #\space
                               ((#\H #\T #\T #\P #\/) (#\1) #\. (#\1)) (#\return #\linefeed)))

(report)
