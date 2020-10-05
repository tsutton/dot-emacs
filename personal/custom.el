(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(TeX-electric-math (quote ("$" . "$")))
 '(TeX-electric-sub-and-superscript nil)
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(c-basic-offset 8)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(custom-safe-themes
   (quote
    ("215d8e4bfb31b07009c7f16e4f2e1c36f21abe7561cf5565a20d87220cad6c84" "067f20c68986bf42c14faafe66489790e5ef89d98914d1d2818d49e1e6da7def" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default)))
 '(delete-active-region nil)
 '(elm-indent-offset 2)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(indent-tabs-mode nil)
 '(org-agenda-custom-commands
   (quote
    (("x" "Un-scheduled" tags "+TODO=\"TODO\"-SCHEDULED<>\"\"-DEADLINE<>\"\"" nil))))
 '(org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-todo-list-sublevels nil)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (calc . t))))
 '(org-hide-leading-stars t)
 '(org-hierarchical-todo-statistics nil)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-roam-completion-system (quote ivy))
 '(package-selected-packages
   (quote
    (lsp-ui lsp-mode counsel-projectile helm flycheck-rust rust-mode org-roam elm-mode projectile-ripgrep ripgrep company-anaconda anaconda-mode json-mode gotest go-projectile go-eldoc company-go rainbow-mode elisp-slime-nav rainbow-delimiters counsel swiper ivy ido-completing-read+ flx-ido yaml-mode smex markdown-mode exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window ein web-mode tide company go-mode)))
 '(projectile-use-git-grep t)
 '(python-shell-interpreter "python3")
 '(swiper-goto-start-of-match t)
 '(term-completion-autolist nil)
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
