(library (http character-set)
  (export charset)
  (import (rnrs (6))
          (http basic-rule))

  ;;; 3.4 Character Sets
  (define charset token)

  ;; HTTP character sets are identified by case-insensitive tokens. The
  ;; complete set of tokens is defined by the IANA Character Set registry
  ;; [19].

  ;;; http://www.iana.org/assignments/character-sets
  ;;; (last updated 2007-05-14)

)
