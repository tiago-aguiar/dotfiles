(add-to-list 'load-path "~/.emacs.d/scripts")
(require 'org-export)

(org-publish-all t)

(message "Build complete!")
