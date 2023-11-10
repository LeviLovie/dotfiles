;;; helm-git-grep-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from helm-git-grep.el

(autoload 'helm-git-grep-ls-files-limited-by-pathspec "helm-git-grep" "\
Show result of `git ls-files' to check files limited by pathspec which is defined by `helm-git-grep-pathspecs'." t)
(autoload 'helm-git-grep "helm-git-grep" "\
Helm git grep.

`helm-git-grep-sources' is used as helm sources." t)
(autoload 'helm-git-grep-at-point "helm-git-grep" "\
Helm git grep with symbol at point.

Use region as input instead of the thing at point
if region exists.

`helm-git-grep-sources' is used as helm sources." t)
(autoload 'helm-git-grep-from-isearch "helm-git-grep" "\
Invoke `helm-git-grep' from isearch." t)
(autoload 'helm-git-grep-from-helm "helm-git-grep" "\
Invoke `helm-git-grep' from other helm." t)
(defconst helm-git-grep-with-exclude-file-pattern-obsolete-message "use `helm-git-grep-pathspecs' to exclude files form search result.")
(autoload 'helm-git-grep-with-exclude-file-pattern "helm-git-grep" "\
Obsolete." t)
(define-obsolete-function-alias 'helm-git-grep-from-here 'helm-git-grep-at-point "0.5")
(make-obsolete 'helm-git-grep-with-exclude-file-pattern helm-git-grep-with-exclude-file-pattern-obsolete-message "0.10.0")
(register-definition-prefixes "helm-git-grep" '("helm-git-grep-"))

;;; End of scraped data

(provide 'helm-git-grep-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; helm-git-grep-autoloads.el ends here