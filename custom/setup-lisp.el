
(unless (package-installed-p 'lispy)
  (package-install 'lispy))

(use-package lispy
  :init
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1))))

(unless (package-installed-p 'nameless)
  (package-install 'nameless))

(use-package nameless
  :init
  (add-hook 'emacs-lisp-mode-hook #'nameless-mode))

(provide 'setup-lisp)
