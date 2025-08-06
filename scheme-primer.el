;;; scheme-primer.el --- Emacs configuration for Scheme Primer development

;;; Commentary:
;; Project-specific Emacs configuration for the Scheme Primer project
;; Loads Geiser, Paredit, and other tools for Scheme development

;;; Code:

;; Set up package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install required packages if not present
(defvar scheme-primer-packages
  '(geiser
    geiser-guile
    paredit
    company
    rainbow-delimiters
    org))

(dolist (pkg scheme-primer-packages)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

;; Project configuration
(defvar scheme-primer-root
  (or (getenv "PROJECT_ROOT")
      (file-name-directory (or load-file-name buffer-file-name)))
  "Root directory of the Scheme Primer project.")

(defvar scheme-primer-name
  (or (getenv "PROJECT_NAME") "scheme-primer")
  "Name of the Scheme Primer project.")

;; Configure Geiser for Guile
(require 'geiser)
(require 'geiser-guile)
(setq geiser-guile-binary "guile3")
(setq geiser-active-implementations '(guile))
(setq geiser-repl-history-filename
      (expand-file-name ".geiser-history" scheme-primer-root))

;; Configure Scheme mode
(add-hook 'scheme-mode-hook
          (lambda ()
            (paredit-mode 1)
            (rainbow-delimiters-mode 1)
            (company-mode 1)
            (setq-local company-backends '(company-capf))
            (geiser-mode 1)))

;; Configure REPL
(add-hook 'geiser-repl-mode-hook
          (lambda ()
            (paredit-mode 1)
            (rainbow-delimiters-mode 1)
            (company-mode 1)))

;; Org mode configuration for literate programming
(require 'org)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((scheme . t)))

;; Set up org-mode for Scheme code blocks
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)

;; Tramp configuration for remote development
(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-verbose 6)

;; Key bindings
(global-set-key (kbd "C-c C-z") 'geiser-repl)
(global-set-key (kbd "C-c C-l") 'geiser-load-file)
(global-set-key (kbd "C-c C-d") 'geiser-doc-symbol-at-point)
(global-set-key (kbd "C-c C-k") 'geiser-compile-current-buffer)
(global-set-key (kbd "C-c C-r") 'geiser-eval-region)

;; Project-specific functions
(defun scheme-primer-run-tests ()
  "Run all tests in the Scheme Primer project."
  (interactive)
  (let ((default-directory scheme-primer-root))
    (compile "make test")))

(defun scheme-primer-open-repl ()
  "Open a Geiser REPL for the project."
  (interactive)
  (let ((default-directory scheme-primer-root))
    (geiser-repl-switch)))

(defun scheme-primer-load-primer ()
  "Load the main primer.scm file."
  (interactive)
  (geiser-load-file (expand-file-name "primer.scm" scheme-primer-root)))

;; Add project-specific key bindings
(global-set-key (kbd "C-c p t") 'scheme-primer-run-tests)
(global-set-key (kbd "C-c p r") 'scheme-primer-open-repl)
(global-set-key (kbd "C-c p l") 'scheme-primer-load-primer)

;; Set default directory to project root
(setq default-directory scheme-primer-root)

;; Open primer.scm on startup
(let ((primer-file (expand-file-name "primer.scm" scheme-primer-root)))
  (when (file-exists-p primer-file)
    (find-file primer-file)))

;; Display startup message
(message "Scheme Primer development environment loaded for %s at %s"
         scheme-primer-name scheme-primer-root)

(provide 'scheme-primer)
;;; scheme-primer.el ends here