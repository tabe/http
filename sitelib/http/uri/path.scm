(library (http uri path)
  (export path
          path-abempty
          path-absolute
          path-noscheme
          path-rootless
          path-empty)
  (import (except (rnrs (6)) /)
          (http abnf)
          (http uri basic-rule))

  ;;; 3.3.  Path

  (define / (char->rule #\/))

  (define : (char->rule #\:))

  (define AT (char->rule #\@))

  ;; pchar         = unreserved / pct-encoded / sub-delims / ":" / "@"
  (define pchar (bar unreserved pct-encoded sub-delims : AT))

  ;; segment       = *pchar
  (define segment (rep* pchar))

  ;; segment-nz    = 1*pchar
  (define segment-nz (rep+ pchar))

  ;; segment-nz-nc = 1*( unreserved / pct-encoded / sub-delims / "@" )
  ;;               ; non-zero-length segment without any colon ":"
  (define segment-nz-nc (rep+ (bar unreserved pct-encoded sub-delims AT)))

  (define path-abempty (rep* (seq / segment)))

  (define path-absolute
    (seq (char->rule #\/)
         (opt (seq segment-nz (rep* (seq / segment))))))

  (define path-noscheme
    (seq segment-nz-nc (rep* (seq / segment))))

  (define path-rootless
    (seq segment-nz (rep* (seq / segment))))

  (define (path-empty s failure success)
    (success '() '()))

  (define path
    (bar path-abempty path-absolute path-noscheme path-rootless path-empty))

)
