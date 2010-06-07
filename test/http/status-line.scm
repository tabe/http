#!r6rs

(import (rnrs (6))
        (http status-line)
        (http assertion)
        (xunit))

(assert-parsing-successfully Status-Line
                             "HTTP/1.1 200 OK\r\n"
                             '(((#\H #\T #\T #\P #\/) (#\1) #\. (#\1)) #\space (#\2 #\0 #\0) #\space ((ctext #\O) (ctext #\K)) (#\return #\linefeed))
                             )
(assert-parsing-successfully Status-Line
                             "HTTP/1.0 404 Not Found\r\n"
                             '(((#\H #\T #\T #\P #\/) (#\1) #\. (#\0)) #\space (#\4 #\0 #\4) #\space ((ctext #\N) (ctext #\o) (ctext #\t) (ctext #\space) (ctext #\F) (ctext #\o) (ctext #\u) (ctext #\n) (ctext #\d)) (#\return #\linefeed))
                             )

(report)
