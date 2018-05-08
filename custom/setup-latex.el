;; LaTeX configuration

(unless (package-installed-p 'auctex)
  (package-install 'auctex))

(use-package tex-site
  :ensure
  auctex
  :init
  (progn
    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)))

(provide 'setup-latex)
