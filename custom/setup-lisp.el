
(unless (package-installed-p 'slime)
  (package-install 'slime))


(use-package slime
  :init
  (progn
    (setq slime-lisp-implementations
          '((ccl ("ccl"))
            (clisp ("clisp,e" "-q"))
            (cmucl ("cmucl" "-quiet"))
            (sbcl ("sbcl" "--noinform") :coding-system utf-8-unix)))
    (if (and (eq system-type 'darwin)
             (executable-find "ccl"))
        (setq slime-default-lisp 'ccl)
      (setq slime-default-lisp 'sbcl))
    (setq slime-contribs '(slime-fancy slime-cl-indent)))
  :config
  (progn
    (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol
          slime-fuzzy-completion-in-place t
          slime-enable-evaluate-in-emacs t
          slime-autodoc-use-multiline-p t
          slime-auto-start 'always)
    (define-key slime-mode-map (kbd "C-c C-s") 'slime-selector)))

(unless (package-installed-p 'lispy)
  (package-install 'lispy))

(use-package lispy
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook #'lispy-mode)
    (add-hook 'lisp-mode-hook #'lispy-mode)))

(unless (package-installed-p 'nameless)
  (package-install 'nameless))

(use-package nameless
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook #'nameless-mode)
    (add-hook 'lisp-mode-hook #'nameless-mode)))


(provide 'setup-lisp)
