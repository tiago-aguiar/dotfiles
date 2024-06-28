(add-to-list 'load-path "~/.emacs.d/scripts")
(require 'org-export)

(org-publish "org-wiki")

(message "Build Wiki complete!")
