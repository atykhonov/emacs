;;; rejeep-misc.el --- Stuff that don't fit anywhere else goes here


(require 'misc)

;; Custom file.
(setq custom-file "~/.emacs.d/rejeep-custom.el")
(load custom-file)

;; Hide some graphical stuff.
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode tooltip-mode))
  (if (fboundp mode)
      (funcall mode -1)))

;; Highlight the selected region.
(transient-mark-mode 1)

;; Hitting delete will delete region and selecting a region and then
;; press a character will replace region with that character.
(pending-delete-mode 1)

;; Show current column.
(column-number-mode 1)

;; Indent with spaces, instead of tabs.
(setq-default indent-tabs-mode nil)

;; No backup files
(setq make-backup-files nil)

;; kill-line will kill whole line (including empty line).
(setq kill-whole-line t)

;; Skip startup message.
(setq inhibit-startup-message t)

;; So that you only have to type y / n instead of yes / no.
(fset 'yes-or-no-p 'y-or-n-p)

;; Easy buffer switching by holding down shift and press any arrow key.
(windmove-default-keybindings 'shift)

;; Show unfinished keystrokes early.
(setq echo-keystrokes 0.1)

;; Maximum decoration
(setq font-lock-maximum-decoration t)

;; Use firefox as default browser.
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; Enable some commands that by default are off.
(dolist (command '(narrow-to-region set-goal-column downcase-region upcase-region))
  (put command 'disabled nil))

;; Highlight matching parenthesis.
(show-paren-mode 1)

;; Show empty lines at end of buffer.
(set-default 'indicate-empty-lines t)

;; For it's awesome rectangle mode.
(setq cua-enable-cua-keys nil)
(setq cua-toggle-set-mark nil)
(cua-mode)

;; Default spelling dictionary.
(setq ispell-dictionary "english")

;; Wrap Region
(require 'wrap-region)
(wrap-region-global-mode t)

;; Drag stuff
(require 'drag-stuff)
(drag-stuff-global-mode t)

;; Prefer utf8.
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Use keats to handle keyboard shortcuts.
(require 'keats)
(require 'keats-interactive)
(setq keats-file "~/.emacs.d/keats")
(keats-mode t)

;; delete-trailing-whitespace is to long.
(defalias 'dtw 'delete-trailing-whitespace)

;; Add parts of each file's directory to the buffer name if not unique.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Minimal finge.
(if (fboundp 'fringe-mode) (fringe-mode 'minimal))

;; Save place in files.
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Color theme
(require 'color-theme)
(require 'color-theme-rejeep)
(color-theme-initialize)
(color-theme-rejeep)

;; Automatic and manual symbol highlighting.
(setq highlight-symbol-idle-delay 0.5)

;; Highlight symbol.
(add-hook 'find-file-hook 'highlight-symbol-mode)

;; Highlight surrounding parentheses.
(add-hook 'find-file-hook 'highlight-parentheses-mode t)

;; Set font size.
(set-face-attribute 'default nil :height 110)

;; Associate file extensions with modes.
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Require a newline at the end.
(setq require-final-newline t)

;; Scroll smooth
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mosue t)
(setq scroll-step 1)
(require 'smooth-scrolling)

;; Set initial major mode.
(setq initial-major-mode 'emacs-lisp-mode)


(provide 'rejeep-misc)
