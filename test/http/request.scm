#!r6rs

(import (rnrs (6))
        (http request)
        (http assertion)
        (xunit))

(assert-parsing-successfully Request
                             (string-append "POST / HTTP/1.1\r\n"
                                            "\r\n"
                                            "foobar")
                             '(((#\P #\O #\S #\T) #\space (#\/ ()) #\space ((#\H #\T #\T #\P #\/) (#\1) #\. (#\1)) (#\return #\linefeed))
                               ()
                               (#\return #\linefeed)
                               ((#\f #\o #\o #\b #\a #\r))))

(report)
