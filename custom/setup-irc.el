;;; setup-irc.el --- Configuration for RCIRC         -*- lexical-binding: t; -*-

;; Copyright (C) 2018

;; Author:  <s.schubert@INOLA-SS>
;; Keywords: convenience, lisp, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public Licensee
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(global-set-key (kbd "C-c I") 'irc)

(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
         :channels ("#anime #fhlug #programming"))))

(setq rcirc-default-nick "Sinex")

(provide 'setup-irc)
;;; setup-irc.el ends here
