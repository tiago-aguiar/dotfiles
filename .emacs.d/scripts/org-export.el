(require 'ox)
(require 'ox-html)
(require 'ox-publish)
(setq org-publish-project-alist
      '(("org-notes"
          ;; Path to your org files.
          :base-directory "~/brain/0-zettels/_public/"
          :base-extension "org"

          ;; Path to your Jekyll project.
          :publishing-directory "~/brain/web/_posts/"
          :recursive t
          :publishing-function org-html-publish-to-html
          ;;:publishing-function org-gfm-export-to-markdown
          :headline-levels 4
          :html-extension "html"
          :body-only t ;; Only export section between <body> </body>
	  ) 

	("org-static"
	 :base-directory "~/brain/4-assets/public/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/brain/web/assets"
	 :recursive t
	 :publishing-function org-publish-attachment)

	("org" :components ("org-notes" "org-static"))))

(provide 'org-export)
