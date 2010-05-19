YPSILON = ypsilon --sitelib=sitelib

.PHONY: check test

check: test

test:
	$(YPSILON) test/http/abnf.scm
	$(YPSILON) test/http/basic-rule.scm
	$(YPSILON) test/http/date-time.scm
	$(YPSILON) test/http/stream.scm
	$(YPSILON) test/http/version.scm
