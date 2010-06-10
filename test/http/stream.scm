#!r6rs

(import (rnrs (6))
        (http stream)
        (xunit))

(define-assert-predicate stream?)

(define s (string->stream "ABC"))
(assert-stream? s)
(assert-input-port? (stream-port s))
(assert-null? (stream-queue s))

(assert-= (char->integer #\A) (stream-pop! s))
(assert-= (char->integer #\B) (stream-pop! s))
(stream-push! s (char->integer #\x))
(stream-push! s (char->integer #\y))
(assert-= (char->integer #\y) (stream-pop! s))
(assert-= (char->integer #\x) (stream-pop! s))
(assert-= (char->integer #\C) (stream-pop! s))
(assert-eof-object? (stream-pop! s))
(assert-eof-object? (stream-pop! s)) ;; idempotent
(stream-push! s (char->integer #\z))
(assert-= (char->integer #\z) (stream-pop! s))

(close-stream s)

(report)

