(library (http stream)
  (export stream
          stream?
          make-stream
          stream-port
          stream-queue
          stream-pop!
          stream-push!
          close-stream
          port->stream
          string->stream)
  (import (rnrs (6)))

  (define-record-type stream
    (fields port (mutable queue)))

  (define (stream-pop! s)
    (assert (stream? s))
    (let ((q (stream-queue s)))
      (if (null? q)
          (get-u8 (stream-port s))
          (let ((b (car q)))
            (stream-queue-set! s (cdr q))
            b))))

  (define (stream-push! s b)
    (assert (stream? s))
    (stream-queue-set! s (cons b (stream-queue s))))

  (define (close-stream s)
    (assert (stream? s))
    (close-port (stream-port s)))

  (define (port->stream p)
    (assert (port? p))
    (make-stream p '()))

  (define (string->stream s)
    (assert (string? s))
    (let* ((bv (string->utf8 s))
           (p (open-bytevector-input-port bv)))
      (port->stream p)))

)
