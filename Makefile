include config.mk

MOSH = env MOSH_LOADPATH=$(XUNIT):test/stub mosh --loadpath=sitelib
YPSILON = env YPSILON_SITELIB=$(XUNIT):test/stub ypsilon --sitelib=sitelib

.PHONY: check test

check: test

test:
	$(MOSH)    test/http/abnf.scm
	$(YPSILON) test/http/abnf.scm
	$(MOSH)    test/http/basic-rule.scm
	$(YPSILON) test/http/basic-rule.scm
	$(MOSH)    test/http/date-time.scm
	$(YPSILON) test/http/date-time.scm
	$(MOSH)    test/http/language-tag.scm
	$(YPSILON) test/http/language-tag.scm
	$(MOSH)    test/http/media-type.scm
	$(YPSILON) test/http/media-type.scm
	$(MOSH)    test/http/parameter.scm
	$(YPSILON) test/http/parameter.scm
	$(MOSH)    test/http/product-token.scm
	$(YPSILON) test/http/product-token.scm
	$(MOSH)    test/http/quality-value.scm
	$(YPSILON) test/http/quality-value.scm
	$(MOSH)    test/http/stream.scm
	$(YPSILON) test/http/stream.scm
	$(MOSH)    test/http/transfer-coding.scm
	$(YPSILON) test/http/transfer-coding.scm
	$(MOSH)    test/http/version.scm
	$(YPSILON) test/http/version.scm
