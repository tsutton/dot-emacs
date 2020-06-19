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
 '(flycheck-checkers
   (quote
    (tsx-tide typescript-tide ada-gnat asciidoctor asciidoc bazel-buildifier c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint cuda-nvcc cwl d-dmd dockerfile-hadolint emacs-lisp emacs-lisp-checkdoc erlang-rebar3 erlang eruby-erubis eruby-ruumba fortran-gfortran go-build go-gofmt go-golint go-vet go-test go-errcheck go-unconvert go-staticcheck groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard json-jsonlint json-python-json json-jq jsonnet less less-stylelint llvm-llc lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix nix-linter opam perl perl-perlcritic php php-phpmd php-phpcs processing proselint protobuf-protoc protobuf-prototool pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar terraform terraform-tflint tex-chktex tex-lacheck texinfo textlint typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby javascript-tide jsx-tide)))
 '(flycheck-go-build-executable "go")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable nil)
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
 '(package-selected-packages
   (quote
    (hcl-mode elm-mode flycheck-yamllint csv-mode go-guru go-rename flycheck govet dockerfile-mode go-gen-test coffee-mode projectile-ripgrep ripgrep company-anaconda anaconda-mode json-mode gotest go-projectile go-eldoc company-go elisp-slime-nav rainbow-delimiters counsel swiper ivy ido-completing-read+ flx-ido yaml-mode smex markdown-mode exec-path-from-shell zop-to-char volatile-highlights super-save smartrep operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window ein web-mode tide company go-mode)))
 '(projectile-use-git-grep t)
 '(python-shell-interpreter "python3")
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
