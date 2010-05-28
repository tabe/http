(library (http uri)
  (export URI
          absolute-URI
          (rename (absolute-URI absoluteURI))
          relativeURI)
  (import (rnrs (6))
          (http abnf)
          (http uri authority)
          (http uri fragment)
          (http uri path)
          (http uri query)
          (http uri scheme)
          )

  (define : (char->rule #\:))

  (define ? (char->rule #\?))

  ;;; 3.  Syntax Components

  ;; hier-part   = "//" authority path-abempty
  ;;             / path-absolute
  ;;             / path-rootless
  ;;             / path-empty
  (define hier-part
    (bar (seq (string->rule "//") authority path-abempty)
         path-absolute
         path-rootless
         path-empty))

  ;; URI         = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
  (define URI
    (seq scheme : hier-part (opt (seq ? query)) (opt (seq (char->rule #\#) fragment))))

  ;;; 4.  Usage

  ;;; 4.2.  Relative Reference

  ;; relative-part = "//" authority path-abempty
  ;;               / path-absolute
  ;;               / path-noscheme
  ;;               / path-empty
  (define relative-part
    (bar (seq (string->rule "//") authority path-abempty)
         path-absolute
         path-noscheme
         path-empty))

  ;;       relative-ref  = relative-part [ "?" query ] [ "#" fragment ]
  (define relative-ref
    (seq relative-part (opt (seq ? query)) (opt (seq #\# fragment))))

  ;;; 4.1.  URI Reference

  (define URI-reference (bar URI relative-ref))

  ;;; 4.3.  Absolute URI

  (define absolute-URI
    (seq scheme (char->rule #\:) hier-part (opt (seq ? query))))

  ;;; D.2.  Modifications

  (define relativeURI (seq relative-part (opt (seq (char->rule #\?) query))))

)
