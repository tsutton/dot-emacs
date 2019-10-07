(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(TeX-electric-math (quote ("$" . "$")))
 '(TeX-electric-sub-and-superscript nil)
 '(c-basic-offset 8)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(delete-active-region nil)
 '(elm-indent-offset 2)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(indent-tabs-mode nil)
 '(org-agenda-custom-commands
   (quote
    (("x" "Un-scheduled" tags "+TODO=\"TODO\"-SCHEDULED<>\"\"-DEADLINE<>\"\"" nil))))
 '(org-agenda-files (quote ("~/Dropbox/todo.org" "~/Dropbox/notes.org")))
 '(org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-todo-list-sublevels nil)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (calc . t))))
 '(org-directory "~/Dropbox")
 '(org-hide-leading-stars t)
 '(org-hierarchical-todo-statistics nil)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(package-selected-packages
   (quote
    (coffee-mode projectile-ripgrep ripgrep company-anaconda anaconda-mode json-mode gotest go-projectile go-eldoc company-go rainbow-mode elisp-slime-nav rainbow-delimiters counsel swiper ivy ido-completing-read+ flx-ido yaml-mode smex markdown-mode exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window ein web-mode tide company go-mode)))
 '(projectile-use-git-grep t)
 '(swiper-goto-start-of-match t)
 '(tex-dvi-view-command
   (quote
    (cond
     ((eq window-system
          (quote x))
      "xdvi")
     ((eq window-system
          (quote w32))
      "yap")
     (t "evince"))))
 '(typescript-indent-level 2)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-attr-value-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(whitespace-style (quote (face trailing empty))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
