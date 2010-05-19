(library (http stream)
  (export stream
          stream?
          make-stream
          stream-port
          stream-queue
          stream-pop!
          stream-push!
          port->stream
          )
  (import (rnrs (6)))

  (define-record-type stream
    (fields port (mutable queue)))

  (define (stream-pop! s)
    (assert (stream? s))
    (let ((q (stream-queue s)))
      (if (null? q)
          (get-char (stream-port s))
          (let ((c (car q)))
            (stream-queue-set! s (cdr q))
            c))))

  (define (stream-push! s c)
    (assert (stream? s))
    (stream-queue-set! s (cons c (stream-queue s))))

  (define (port->stream p)
    (assert (port? p))
    (make-stream p '()))

)
