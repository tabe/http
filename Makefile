include config.mk

MOSH = env MOSH_LOADPATH=$(XUNIT) mosh --loadpath=sitelib
YPSILON = env YPSILON_SITELIB=$(XUNIT) ypsilon --sitelib=sitelib

.PHONY: check test

check: test

test:
	$(MOSH) test/http/abnf.scm
	$(MOSH) test/http/basic-rule.scm
	$(MOSH) test/http/date-time.scm
	$(MOSH) test/http/stream.scm
	$(MOSH) test/http/version.scm
	$(YPSILON) test/http/abnf.scm
	$(YPSILON) test/http/basic-rule.scm
	$(YPSILON) test/http/date-time.scm
	$(YPSILON) test/http/stream.scm
	$(YPSILON) test/http/version.scm
