(library (http assertion)
  (export assert-parsing-successfully)
  (import (rnrs (6))
          (only (http stream) port->stream)
          (xunit))

  (define-syntax assert-parsing-successfully
    (syntax-rules ()
      ((_ name str)
       (assert-parsing-successfully name str (string->list str)))
      ((_ name str expected-tree)
       (assert-parsing-successfully name str (reverse (string->list str)) expected-tree))
      ((_ name str expected-head expected-tree)
       (call-with-port (open-string-input-port str)
         (lambda (port)
           (name
            (port->stream port)
            (lambda _
              (fail! "assert-parsing-successfully failed"))
            (lambda (head tree)
              (assert-equal? expected-head head)
              (assert-equal? expected-tree tree))))))))

)
