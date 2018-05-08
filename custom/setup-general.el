(menu-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(unless (package-installed-p 'company)
  (package-install 'company))

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))

(unless (package-installed-p 'projectile)
  (package-install 'projectile))

;; Package: projectile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(unless (package-installed-p 'zygospore)
  (package-install 'zygospore))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

(unless (package-installed-p 'windmove)
  (package-install 'windmove))

(windmove-default-keybindings)

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(use-package rainbow-delimiters
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

;; setup powerline
(unless (package-installed-p 'powerline)
  (package-install 'powerline))

(use-package powerline)

;; setup indent-guide
(unless (package-installed-p 'indent-guide)
  (package-install 'indent-guide))
(use-package indent-guide
  :init
  (progn
    (indent-guide-global-mode)
    (setq indent-guide-recursive t)))

;; setup which-key
(unless (package-installed-p 'which-key)
  (package-install 'which-key))

(which-key-mode)

(use-package color-theme-sanityinc-tomorrow
  :init
  (progn
    (color-theme-sanityinc-tomorrow-night)))

(use-package rainbow-identifiers
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)
    (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face
          rainbow-identifiers-cie-l*a*b*-lightness 70
          rainbow-identifiers-cie-l*a*b*-saturation 30
          rainbow-identifiers-cie-l*a*b*-color-count 20
          ;; override theme faces
          rainbow-identifiers-faces-to-override '(highlight-quoted-symbol
                                                  font-lock-variable-name-face
                                                  font-lock-function-name-face
                                                  font-lock-type-face
                                                  js2-function-param
                                                  js2-external-variable
                                                  js2-instance-member
                                                  js2-private-function-call))))


(use-package magit)


(provide 'setup-general)
