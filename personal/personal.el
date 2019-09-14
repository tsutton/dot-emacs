;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General purpose keybindings

(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "C-M-a") 'query-replace) ;formerly beginning-of-defun
(global-set-key (kbd "C-M-e") 'query-replace-regexp) ;formerly end-of-defun
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "M-C-S-n") 'forward-line) ; good for macros 

(define-key emacs-lisp-mode-map (kbd "C-c C-l") 'emacs-lisp-byte-compile-and-load)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode set-up
(add-hook 'org-mode-hook 
	  (lambda () (progn 
		       (define-key org-mode-map (kbd "C-M-j") 'org-shiftmetaleft)
		       (define-key org-mode-map (kbd "C-M-k") 'org-shiftmetaright))))
(add-hook 'org-mode-hook 'toggle-truncate-lines)

(when (equal system-type 'windows-nt)
  (let ((prefix
       (cond
        ((equal (system-name) "TAYLOR-SURFACE") "C:\\Users\\taylo\\Dropbox\\")
        ((equal (system-name) "ADAMS-WINDOWS") "C:\\Users\\Taylor Sutton\\Dropbox\\")
        )
       ))
    (progn 
      (setq org-agenda-files (list (concat prefix "todo.org") (concat prefix "notes.org")))
      (setq org-directory prefix)
      )
    )
  )
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-mode-specific things
(add-hook 'c-mode-hook
          (lambda () (progn
                       (define-key c-mode-map (kbd "C-v") 'c-end-of-defun)
                       (define-key c-mode-map (kbd "M-v") 'c-beginning-of-defun)
                       (define-key c-mode-map (kbd "C-,") 'query-replace)
                       (define-key c-mode-map (kbd "C-.") 'query-replace-regexp)
                       )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; web development modes

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc. stuff

; Display (line,col) in the bottom bar
;; (column-number-mode)  - handled by prelude

; Enable ido-mode
(require 'ido) 
(ido-mode t)

; Enabe various useful commands that are disabled by default
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil) ; Bound to C-x C-u by default
(put 'downcase-region 'disabled nil) ; Bound to C-x C-l by default
(put 'set-goal-column 'disabled nil) ; particularly good for macro

; yasnippet - I don't really use this for anything, but it's useful, so maybe I'll reinstall some day
; (require 'yasnippet)
; (yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI set-up
(tool-bar-mode 0)
(scroll-bar-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Archive of old things that might come back

;; org-mobile stuff (with prefix as set by the stuff)
;; (setq org-mobile-files (quote (org-agenda-files )))
;; ;(setq org-mobile-checksum-binary "\"c:\\Program Files (x86)\\GnuWin32\\bin\\sha1sum.exe\"")
;; (setq org-mobile-inbox-for-pull (concat prefix "todo.org"))
;; (setq org-mobile-directory (concat prefix "Apps\\MobileOrg"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Typescript and Tide-mode things
(require 'flycheck)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(require 'tide)
(define-key tide-mode-map (kbd "C->") 'tide-references)
(define-key tide-mode-map (kbd "C-<") 'tide-rename-symbol)
(define-key tide-mode-map (kbd "M-/") 'company-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load clever-specific things onto work computer
(if (equal (system-name) "quillen.local")
    (progn
      (require 'exec-path-from-shell)
      (exec-path-from-shell-initialize)
      (if (file-exists-p "~/clever.el")
          (load "~/clever")
        )
      )
  )
