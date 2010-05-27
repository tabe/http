include config.mk

MOSH = env MOSH_LOADPATH=$(XUNIT):test/stub mosh --loadpath=sitelib
YPSILON = env YPSILON_SITELIB=$(XUNIT):test/stub ypsilon --sitelib=sitelib

.PHONY: check stats test

check: test

stats:
	find sitelib -type f -name '*.scm' -print0 | xargs -0 wc -l | tail -1
	find test    -type f -name '*.scm' -print0 | xargs -0 wc -l | tail -1

test:
	$(MOSH)    test/http/abnf.scm
	$(YPSILON) test/http/abnf.scm
	$(MOSH)    test/http/basic-rule.scm
	$(YPSILON) test/http/basic-rule.scm
	$(MOSH)    test/http/character-set.scm
	$(YPSILON) test/http/character-set.scm
	$(MOSH)    test/http/content-coding.scm
	$(YPSILON) test/http/content-coding.scm
	$(MOSH)    test/http/date-time.scm
	$(YPSILON) test/http/date-time.scm
	$(MOSH)    test/http/entity-tag.scm
	$(YPSILON) test/http/entity-tag.scm
	$(MOSH)    test/http/header-field/accept-charset.scm
	$(YPSILON) test/http/header-field/accept-charset.scm
	$(MOSH)    test/http/header-field/accept-encoding.scm
	$(YPSILON) test/http/header-field/accept-encoding.scm
	$(MOSH)    test/http/header-field/accept-language.scm
	$(YPSILON) test/http/header-field/accept-language.scm
	$(MOSH)    test/http/header-field/accept-ranges.scm
	$(YPSILON) test/http/header-field/accept-ranges.scm
	$(MOSH)    test/http/header-field/accept.scm
	$(YPSILON) test/http/header-field/accept.scm
	$(MOSH)    test/http/header-field/age.scm
	$(YPSILON) test/http/header-field/age.scm
	$(MOSH)    test/http/header-field/allow.scm
	$(YPSILON) test/http/header-field/allow.scm
	$(MOSH)    test/http/header-field/cache-control.scm
	$(YPSILON) test/http/header-field/cache-control.scm
	$(MOSH)    test/http/header-field/connection.scm
	$(YPSILON) test/http/header-field/connection.scm
	$(MOSH)    test/http/header-field/content-encoding.scm
	$(YPSILON) test/http/header-field/content-encoding.scm
	$(MOSH)    test/http/header-field/content-language.scm
	$(YPSILON) test/http/header-field/content-language.scm
	$(MOSH)    test/http/header-field/content-length.scm
	$(YPSILON) test/http/header-field/content-length.scm
	$(MOSH)    test/http/header-field/content-md5.scm
	$(YPSILON) test/http/header-field/content-md5.scm
	$(MOSH)    test/http/header-field/content-range.scm
	$(YPSILON) test/http/header-field/content-range.scm
	$(MOSH)    test/http/header-field/content-type.scm
	$(YPSILON) test/http/header-field/content-type.scm
	$(MOSH)    test/http/header-field/date.scm
	$(YPSILON) test/http/header-field/date.scm
	$(MOSH)    test/http/header-field/etag.scm
	$(YPSILON) test/http/header-field/etag.scm
	$(MOSH)    test/http/header-field/expect.scm
	$(YPSILON) test/http/header-field/expect.scm
	$(MOSH)    test/http/header-field/expires.scm
	$(YPSILON) test/http/header-field/expires.scm
	$(MOSH)    test/http/header-field/from.scm
	$(YPSILON) test/http/header-field/from.scm
	$(MOSH)    test/http/header-field/host.scm
	$(YPSILON) test/http/header-field/host.scm
	$(MOSH)    test/http/header-field/if-match.scm
	$(YPSILON) test/http/header-field/if-match.scm
	$(MOSH)    test/http/header-field/if-modified-since.scm
	$(YPSILON) test/http/header-field/if-modified-since.scm
	$(MOSH)    test/http/header-field/if-none-match.scm
	$(YPSILON) test/http/header-field/if-none-match.scm
	$(MOSH)    test/http/header-field/if-range.scm
	$(YPSILON) test/http/header-field/if-range.scm
	$(MOSH)    test/http/header-field/if-unmodified-since.scm
	$(YPSILON) test/http/header-field/if-unmodified-since.scm
	$(MOSH)    test/http/header-field/last-modified.scm
	$(YPSILON) test/http/header-field/last-modified.scm
	$(MOSH)    test/http/language-tag.scm
	$(YPSILON) test/http/language-tag.scm
	$(MOSH)    test/http/media-type.scm
	$(YPSILON) test/http/media-type.scm
	$(MOSH)    test/http/message-header.scm
	$(YPSILON) test/http/message-header.scm
	$(MOSH)    test/http/method.scm
	$(YPSILON) test/http/method.scm
	$(MOSH)    test/http/parameter.scm
	$(YPSILON) test/http/parameter.scm
	$(MOSH)    test/http/product-token.scm
	$(YPSILON) test/http/product-token.scm
	$(MOSH)    test/http/quality-value.scm
	$(YPSILON) test/http/quality-value.scm
	$(MOSH)    test/http/range-unit.scm
	$(YPSILON) test/http/range-unit.scm
	$(MOSH)    test/http/stream.scm
	$(YPSILON) test/http/stream.scm
	$(MOSH)    test/http/transfer-coding.scm
	$(YPSILON) test/http/transfer-coding.scm
	$(MOSH)    test/http/version.scm
	$(YPSILON) test/http/version.scm
