;;;  -*- lexical-binding: t -*-

;; Modified version of tb-keycast: https://github.com/ir33k/tb-keycast
;; Original Author: irek <mail@gumen.pl>


;;; Code:

(defconst sk/keycast-version "1.7" "Version of `sk/keycast-mode'.")
(defvar sk/keycast--key "" "Last pressed key.")
(defvar sk/keycast--count 1 "Last key repeat counter.")
(defvar sk/keycast--cmd "" "Last used command name.")
(defvar sk/keycast--str "" "Last keycast status string.")

(defgroup sk/keycast nil "Custom Keycast."
  :prefix "sk/keycast-" :group 'environment :version "29.1")

(defcustom sk/keycast-format
  '((" %s " sk/keycast--key :inherit mode-line-highlight :weight bold)
    (" %s " sk/keycast--cmd :slant italic)
    ("x%d " (lambda () (if (> sk/keycast--count 1) sk/keycast--count))))
  "Sorted list of items that produce `sk/keycast--str'.
Read doc of `sk/keycast--format-to-string' for details."
  :group 'sk/keycast :type '(repeat (cons string (cons variable (plist)))))

(defcustom sk/keycast-ignore '(typing  minibuffer)
  "List of ignored commands.
Possible key values: `typing', `minibuffer'."
  :group 'sk/keycast :type '(set (const :tag "Typing" typing)
                                 (const :tag "Minibuffer cmd" minibuffer)))
(defcustom sk/keycast-align-right-p t
  "Align sk/keycast status to right if value is not nil."
  :group 'sk/keycast :type 'boolean)

(defcustom sk/keycast-min-width 224
  "Minimal width (in pixels) that is always taken by keycast status.
This helps avoid jumping of status to left and right and to next
tab-bar line when there are more tabs.  Higher value makes
jumping less frequent.  To disable use 0."
  :group 'sk/keycast :type 'number)

(defun sk/keycast--format-to-string (format)
  "Transform format items to single formated string with faces.
FORMAT is a list of items.  Each item has format string \\(see
`format' for details\\) as first argument.  Second argument can
be a regular value, var name, list of values or var names,
function that evaluate to one of mentioned values.  Last argument
is optional face attributes, see Info node `(elisp) Faces' for
details.  Returned value is single string created by
concatenating formatting results of each item.  If item second
argument results in nil then item is ignored."
  (mapconcat
   (lambda (item)
     (seq-let (fmt var &rest face-attr) item
       (if (functionp var) (setq var (funcall var)))
       (if (or (eq var nil)
               (and (symbolp var) (eq (symbol-value var) nil)))
           nil
         (if (not (listp var)) (setq var (list var)))
         (setq var (seq-map (lambda (v)
                              (if (symbolp v) (symbol-value v) v))
                            var))
         (propertize (apply (apply-partially 'format fmt) var)
                     'face face-attr))))
   format))

(defun sk/keycast--update ()
  "Update key, cmd and count keycast vars to create `sk/keycast--str'."
  (when (and
         ;; Ignore undefined bindings.
         this-command
         ;; Ignore mouse move while drag to avoid lags.
         (not (string-match "^#" (format "%s" this-command)))
         ;; Maybe ignore regular typing.
         (or (not (seq-contains-p sk/keycast-ignore 'typing))
             (not (string-match ".*self-insert-command.*"
                                (format "%s" this-command))))
         ;; Maybe ignore minibuffer commands.
         (or (not (seq-contains-p sk/keycast-ignore 'minibuffer))
             (not (string-match (format ".+%s" this-command)
                                (format "%s" (this-command-keys))))))
    
    (if (not (eq last-command this-command)) (setq sk/keycast--count 0))
    (setq sk/keycast--count (1+ sk/keycast--count))
    (setq sk/keycast--key (key-description (this-command-keys)))
    (setq sk/keycast--cmd (format "%s" this-command))
    ;; Set status value with last pressed key, counter and cmd name.
    ;; Left margin in (one empty spece) used only if `tab-bar-format'
    ;; is not nil and right margin is to stop status face background
    ;; color from going all the way to the right window edge.
    (setq sk/keycast--str
          (concat
           (if (not (eq tab-bar-format nil)) " ")
           (sk/keycast--format-to-string sk/keycast-format)
           " "))

    ;; Invoke `force-mode-line-update' to update modeline.
    (force-mode-line-update)))

(defun sk/keycast--start ()
  "Enable `sk/keycast-mode'."
  (add-hook 'pre-command-hook 'sk/keycast--update 90)
  (sk/keycast--update))

(defun sk/keycast--stop ()
  "Disable `sk/keycast-mode'."
  (remove-hook 'pre-command-hook 'sk/keycast--update)
  (force-mode-line-update))

(define-minor-mode sk/keycast-mode
  "Global minor mode that shows last pressed key in `mode-line'.x
Print corresponding function name along with key binding and
counter of how many times it was repeated."
  :global t :lighter nil
  (if sk/keycast-mode (sk/keycast--start) (sk/keycast--stop)))
