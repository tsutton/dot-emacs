;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General purpose keybindings

(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "M-[") 'beginning-of-defun)
(global-set-key (kbd "M-]") 'end-of-defun)
(global-set-key (kbd "C-M-a") 'anzu-query-replace) ;formerly beginning-of-defun
(global-set-key (kbd "C-M-e") 'anzu-query-replace-regexp) ;formerly end-of-defun
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

(cond
 ((equal system-type 'windows-nt)
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
 ((equal (system-name) "quillen")
  (setq org-agenda-files (quote ("~/general.org")))
  (setq org-directory "~/")
  )
 (t
  (setq org-agenda-files (quote ("~/Dropbox/todo.org" "~/Dropbox/notes.org")))
  (setq org-directory "~/Dropbox")
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
(global-nlinum-mode -1)
(menu-bar-mode -1)

; Enable ido-mode
;; (require 'ido)
;; (ido-mode t)

; Enable various useful commands that are disabled by default
; These three are enabled by prelude-editor
; (put 'narrow-to-region 'disabled nil)
; (put 'upcase-region 'disabled nil) ; Bound to C-x C-u by default
; (put 'downcase-region 'disabled nil) ; Bound to C-x C-l by default
(put 'set-goal-column 'disabled nil) ; particularly good for macro

; yasnippet - I don't really use this for anything, but it's useful, so maybe I'll reinstall some day
; (require 'yasnippet)
; (yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI set-up
; (tool-bar-mode 0) - already done by prelude
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
(define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go things
(setq gofmt-command "goimports")

(defun my-go-mode-hook ()
;;  (company-mode 1) handled elsewhere
  (define-key go-mode-map (kbd "M-/") 'company-complete)
  (whitespace-mode 0) ; whitespace-mode highlights tabs which we DO NOT want for go
  ; (set (make-local-variable 'company-backends) '(company-go)) -- set by prelude-go module
  ; this way, gofmt will be called before save but only when go-mode is on
  ; (add-hook 'before-save-hook 'gofmt-before-save nil 1)) -- set by prelude-go module
)

;; set my hook to run last
(add-hook 'go-mode-hook 'my-go-mode-hook t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prelude

;; Eventually, I will disable the (require 'prelude-global-keybindings) line
;;   from Prelude's init.el. In the mean time, I'll futz with the keybindings
;;   one-by-one
(if (equal (lookup-key (current-global-map) (kbd "C-c j"))
           'avy-goto-word-or-subword-1)
    (global-set-key (kbd "C-c j") 'avy-goto-char-timer)
  )
(if (equal (lookup-key (current-global-map) (kbd "s-."))
           'avy-goto-word-or-subword-1)
    (global-unset-key (kbd "s-."))
  )

;; Prelude rebinds C-<backspace> to basically kill-line then indent
;;    I'd rather keep that key as the original and use M-<backspace> for that
(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
(global-set-key (kbd "M-<backspace>") 'crux-kill-line-backwards)

(delete-selection-mode 0)
(global-auto-revert-mode 0)
(size-indication-mode 0)

;; which-function-mode isn't helpful e.g. in org-mode, so
;;   only turn it on in prog-modes
(which-function-mode 0)
(add-hook 'prelude-prog-mode-hook 'which-function-mode)

;; The projectile mode line is too long! I don't need to know the type of
;;  project, I likely already know that immediately from the name
(defun projectile-custom-mode-line ()
  (let ((project-name (projectile-project-name)))
    (format " proj:%s"
            (or project-name "-"))))

(setq projectile-mode-line-function 'projectile-custom-mode-line)

;; Until I actually have a project using EditorConfig,
;;   there's no reason to have it enabled
(editorconfig-mode 0)

;; prelude-crux has the line:
;; (crux-with-line-or-region kill-region)
;; which is a macro unraveling into an advice which makes kill-region kill the current line
;; when region is inactive. but I use inactive region sometimes, so I don't like that behavior
(advice-remove 'kill-region 'ad-Advice-kill-region)

;; here's a list of minor modes; I'll delete things as I understand/customize them
;; TODO next up for customization:
;; Company
;; Ivy
;; Recentf
;; undo-tree
;; Enabled minor modes:  Async-Bytecomp-Package Auto-Composition
;; Auto-Compression Auto-Encryption Auto-Revert Beacon
;; Company Diff-Auto-Refine Diff-Hl Eldoc Electric-Indent
;; Elisp-Slime-Nav File-Name-Shadow Flx-Ido Flycheck Flyspell Font-Lock
;; Global-Anzu Global-Company Global-Diff-Hl Global-Eldoc Global-Flycheck
;; Global-Font-Lock Global-Git-Commit Global-Hl-Line Global-Hl-Todo
;; Global-Undo-Tree Hl-Todo Ido-Ubiquitous Ivy
;; Magit-Auto-Revert Mouse-Wheel Prelude
;; Projectile Rainbow Rainbow-Delimiters Recentf Save-Place Savehist
;; Shell-Dirtrack Show-Smartparens Show-Smartparens-Global Smartparens
;; Smartparens-Strict Tooltip Transient-Mark Undo-Tree
;; Volatile-Highlights Which-Key Winner

;; Modes that I don't want to think about or see
;; aka diminsh ALL THE THINGS
(diminish 'whitespace-mode)
(diminish 'auto-revert-mode)
(diminish 'company-mode)
(diminish 'super-save-mode)
(diminish 'ivy-mode)
(diminish 'which-key-mode)

(setq prelude-guru nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ivy, swiper, counsel
;; I'm not a huge fan of all the things in prelude-ivy module
;; but some of this is from that!
(prelude-require-packages '(ivy swiper counsel))
(require 'ivy)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(setq projectile-completion-system 'ivy)
(counsel-projectile-mode 1)

;; I prefer swiper-isearch over swiper -- because I use isearch
;;  to navigate within a line, (e.g. I might search " " to advance)
;;  to the next space on the line I'm in
;; Perhpas I'll still bind swiper to something, but eh
(global-set-key [remap isearch-forward] 'swiper-isearch)
(global-set-key [remap isearch-backward] 'swiper-isearch-backward) ; global


(global-set-key (kbd "M-x") 'counsel-M-x)
;; Note - it seems remapping (kbd "<f1> *") also remaps C-h *
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; These are from the lines from prelude-ivy (as of 9-15-19) that I'm not using
;; with reasoning below
;; TODO I am trialing counsel-find-file instead of ido
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key "\C-s" 'swiper)
;;   I remap this in a different way
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;;    I don't use <f-> for anything
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c a") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;;   I use projectile-mode for these project-level things

;; By default this is bound to S-SPC, but I like C-SPC better, and it matches with ido that way
(define-key ivy-minibuffer-map (kbd "C-SPC") 'ivy-restrict-to-matches)

;; Ido defines a few keymaps that it uses in different situations
;; I want to add to all of them to navigate matches
;; (these are bound to left and right already by default)
;; TODO I am trialing counsel-find-file instead of ido
;; (define-key ido-common-completion-map (kbd "C-n") 'ido-next-match)
;; (define-key ido-common-completion-map (kbd "C-p") 'ido-prev-match)

;; ido tries to use the filename at point as a seed to find-file,
;; but more often ten not that messes things up
;; (setq ido-use-filename-at-point nil)

;; Load my WIP jiq-mode
(require 'jiq)

;; Disable flyspell
;; TODO try re-enabling this; making sure that prog mode uses flyspell-prog-mode
;; (setq prelude-flyspell nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load clever-specific things onto work computer
(if (equal (system-name) "quillen")
    (progn
      (require 'exec-path-from-shell)
      (exec-path-from-shell-initialize)
      (if (file-exists-p "~/clever.el")
          (load "~/clever")
        )
      )
  )


(put 'scroll-left 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP mode set-up for language server
;; TODO - is this the prefix I want?
(setq lsp-keymap-prefix "C-c l")

(require 'lsp-mode)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)

(lsp-register-custom-settings
 '(("gopls.staticcheck" t t)))

;; in go mode, have C-M-i: complete-symbol => completion-at-point-functions => lsp-completion-at-point
;; if i jus sit around and idle, company kicks in, it seems
;; now company has the numbers and respond to M-#, but lsp does not

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;; TODO learn the key bindings for lsp-find-definition/references/etc
;; TODO configuration: https://emacs-lsp.github.io/lsp-mode/page/main-features/
;;      breadcrumps, code actions, errors on modeline
;;      format on save
;; TODO configure snippets with yasnippet

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme
;; Currently using misterioso but with the highlight foreground color changed
;; for reference, the original was: #e1e1e0
