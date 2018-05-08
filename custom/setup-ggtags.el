;;; setup-ggtags.el --- ggtags configuration file    -*- lexical-binding: t; -*-

;; Copyright (C) 2018

;; Author:  <s.schubert@INOLA-SS>
;; Keywords: convenience, lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(use-package ggtags
  :config
  (progn
    (ggtags-mode 1)
    (add-hook 'c-mode-common-hook
              (lambda ()
                (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
                  (ggtags-mode 1))))

    (dolist (map (list ggtags-mode-map dired-mode-map))
      (define-key map (kbd "C-c g s") 'ggtags-find-other-symbol)
      (define-key map (kbd "C-c g h") 'ggtags-view-tag-history)
      (define-key map (kbd "C-c g r") 'ggtags-find-reference)
      (define-key map (kbd "C-c g f") 'ggtags-find-file)
      (define-key map (kbd "C-c g c") 'ggtags-create-tags)
      (define-key map (kbd "C-c g u") 'ggtags-update-tags)
      (define-key map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
      (define-key map (kbd "M-.") 'ggtags-find-tag-dwim)
      (define-key map (kbd "M-,") 'pop-tag-mark)
      (define-key map (kbd "C-c <") 'ggtags-prev-mark)
      (define-key map (kbd "C-c >") 'ggtags-next-mark))))


(provide 'setup-ggtags)
;;; setup-ggtags.el ends here
