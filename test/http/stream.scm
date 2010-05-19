#!r6rs

(import (rnrs (6))
        (http stream)
        (xunit))

(define-assert-predicate stream?)

(define s (port->stream (open-string-input-port "ABC")))
(assert-stream? s)
(assert-input-port? (stream-port s))
(assert-null? (stream-queue s))

(assert-char=? #\A (stream-pop! s))
(assert-char=? #\B (stream-pop! s))
(stream-push! s #\x)
(stream-push! s #\y)
(assert-char=? #\y (stream-pop! s))
(assert-char=? #\x (stream-pop! s))
(assert-char=? #\C (stream-pop! s))
(assert-eof-object? (stream-pop! s))
(assert-eof-object? (stream-pop! s)) ;; idempotent
(stream-push! s #\z)
(assert-char=? #\z (stream-pop! s))

(report)

