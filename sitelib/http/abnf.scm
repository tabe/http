(library (http abnf)
  (export char->rule
          string->rule
          pair->rule
          seq
          bar
          rep
          rep*
          rep+
          rep=
          opt
          OCTET
          CHAR
          UPALPHA
          LOALPHA
          ALPHA
          DIGIT
          CTL
          CR
          LF
          SP
          HT
          DQ
          CRLF
          LWS
          HEX
          separator-chars
          separator
          )
  (import (rnrs (6))
          (only (http stream) stream-pop! stream-push!))

  ;; 2 Notational Conventions and Generic Grammar
  ;; 2.1 Augmented BNF
  ;; 2.2 Basic Rules

  (define (char->rule x)
    (assert (char? x))
    (lambda (s failure success)
      (let ((c (stream-pop! s)))
        (cond ((eof-object? c)
               (failure '()))
              ((char=? x c)
               (success (list c) c))
              (else
               (failure (list c)))))))

  (define (string->rule str)
    (assert (string? str))
    (apply seq (map char->rule (string->list str))))

  (define (pair->rule x)
    (assert (pair? x))
    (lambda (s failure success)
      (let ((c (stream-pop! s)))
        (cond ((eof-object? c)
               (failure '()))
              ((let ((d (char->integer c)))
                 (and (<= (car x) d)
                      (<= d (cdr x))))
               (success (list c) c))
              (else
               (failure (list c)))))))

  (define (seq arg . rest)
    (lambda (s failure success)
      (arg
       s
       failure
       (lambda (h1 t1)
         (if (null? rest)
             (success h1 (list t1))
             ((apply seq rest)
              s
              (lambda (h2)
                (failure (append h2 h1)))
              (lambda (h2 t2)
                (success (append h2 h1) (cons t1 t2)))))))))

  (define (bar . args)
    (lambda (s failure success)
      (let loop ((candidates args))
        (if (null? candidates)
            (failure '())
            ((car candidates)
             s
             (lambda (tail)
               (for-each
                (lambda (x) (stream-push! s x))
                tail)
               (loop (cdr candidates)))
             success)))))

  (define (rep n m rule)
    (lambda (s failure success)
      (let loop ((head '())
                 (tree '()))
        (if (and (integer? m)
                 (= m (length tree)))
            (success head (reverse tree))
            (rule
             s
             (lambda (h)
               (for-each
                (lambda (x) (stream-push! s x))
                h)
               (if (<= n (length tree))
                   (success head (reverse tree))
                   (failure head)))
             (lambda (h t)
               (loop (append h head) (cons t tree))))))))

  (define (rep* rule) (rep 0 #t rule))

  (define (rep+ rule) (rep 1 #t rule))

  (define (rep= n rule) (rep n n rule))

  (define (opt rule) (rep 0 1 rule))

  ;; OCTET          = <any 8-bit sequence of data>
  (define (OCTET s failure success)
    (let ((c (stream-pop! s)))
      (if (eof-object? c)
          (failure '())
          (success (list c) c))))

  ;; CHAR           = <any US-ASCII character (octets 0 - 127)>
  (define CHAR (pair->rule '(0 . 127)))

  ;; UPALPHA        = <any US-ASCII uppercase letter "A".."Z">
  (define UPALPHA (pair->rule '(65 . 90)))

  ;; LOALPHA        = <any US-ASCII lowercase letter "a".."z">
  (define LOALPHA (pair->rule '(97 . 122)))

  ;; ALPHA          = UPALPHA | LOALPHA
  (define ALPHA (bar UPALPHA LOALPHA))

  ;; DIGIT          = <any US-ASCII digit "0".."9">
  (define DIGIT (pair->rule '(48 . 57)))

  ;; CTL            = <any US-ASCII control character
  ;;                  (octets 0 - 31) and DEL (127)>
  (define CTL (bar (pair->rule '(0 . 31)) (char->rule #\delete)))

  ;; CR             = <US-ASCII CR, carriage return (13)>
  (define CR (char->rule #\return))

  ;; LF             = <US-ASCII LF, linefeed (10)>
  (define LF (char->rule #\linefeed))

  ;; SP             = <US-ASCII SP, space (32)>
  (define SP (char->rule #\space))

  ;; HT             = <US-ASCII HT, horizontal-tab (9)>
  (define HT (char->rule #\tab))

  ;; <">            = <US-ASCII double-quote mark (34)>
  (define DQ (char->rule #\"))

  ;; CRLF           = CR LF
  (define CRLF (seq CR LF))

  ;; LWS            = [CRLF] 1*( SP | HT )
  (define LWS (seq (opt CRLF) (rep+ (bar SP HT))))

  ;; HEX            = "A" | "B" | "C" | "D" | "E" | "F"
  ;;                | "a" | "b" | "c" | "d" | "e" | "f" | DIGIT
  (define HEX (bar ALPHA DIGIT))

  ;; separators     = "(" | ")" | "<" | ">" | "@"
  ;;                | "," | ";" | ":" | "\" | <">
  ;;                | "/" | "[" | "]" | "?" | "="
  ;;                | "{" | "}" | SP | HT
  (define separator-chars
    '(#\( #\) #\< #\> #\@ #\, #\; #\: #\\ #\" #\/ #\[ #\] #\? #\= #\{ #\} #\space #\tab))

  (define separator
    (apply bar (map char->rule separator-chars)))

)
