(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(color-theme markdown-mode yaml-mode haml-mode scss-mode less-css-mode textmate rvm
                                  flymake flymake-ruby flymake-shell
                                  starter-kit starter-kit-ruby starter-kit-js starter-kit-eshell starter-kit-bindings))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
