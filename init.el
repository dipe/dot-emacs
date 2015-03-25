(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(flymake-ruby idle-highlight-mode magit scss-mode starter-kit-eshell yaml-mode
                                   color-theme flymake-shell ido-ubiquitous markdown-mode smex starter-kit-js
                                   find-file-in-project gnupg inf-ruby paredit starter-kit starter-kit-ruby
                                   flymake-easy haml-mode less-css-mode rvm starter-kit-bindings textmate))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
