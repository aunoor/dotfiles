;; Name    : Arc Dark Theme. Based on Arc Dark GTK theme.
;; Author  : Dmitry Komissarov <aunoor@gmail.com>
;; License : GPL-2
;; Some code borrowed from Candido theme

(define theme-name 'Arc)

;; Defcustom and defgroup
(defgroup Arc:group "Arc theme"
  :group appearance)

(defcustom arc-c:theme-variant 'Dark "Theme variant"
  :group (appearance Arc:group)
  :type (choice Arc Dark)
;  :options (Arc Dark)
;  :after-set (lambda () (color-changed)))
  :after-set (lambda () (color-changed)))


(define (color-changed)
  (case arc-c:theme-variant
    ((Arc) (setArc))
    ((Dark) (setArcDark))
  )
  (redefineFrameStyle)
)

;Font for buttons
(defvar ibfnt (get-font-typed "Pango" "Material Design Icons 13"))
;Variables for title font colors
(defvar C_title_focused)
(defvar C_title_unfocused)
;Variables for border colors
(defvar C_wm_bg_focused)
(defvar C_wm_bg_unfocused)
;Button background
(defvar ibtbg)
;Buttons and title foreground
(defvar ibfgcolors)


(define (setArc)
    (setq C_title_focused "#70788d")
    (setq C_title_unfocused "#979dac")

    (setq C_wm_bg_focused "#e7e8eb")
    (setq C_wm_bg_unfocused "#e7e8eb")
    (setq ibtbg   (list C_wm_bg_unfocused C_wm_bg_focused nil nil))
    (setq ibfgcolors (list C_title_unfocused C_title_focused))
)

(define (setArcDark)
    (setq C_title_focused "#afb8c6")
    (setq C_title_unfocused "#8a939f")

    (setq C_wm_bg_focused "#2f343f")
    (setq C_wm_bg_unfocused "#2f343f")
    (setq ibtbg   (list C_wm_bg_unfocused C_wm_bg_focused nil nil))
    (setq ibfgcolors (list C_title_unfocused C_title_focused))
)

(define (redefineFrameStyle)
  (let*
    (
      (ibtbg   (list C_wm_bg_unfocused C_wm_bg_focused nil nil))
      (ibfgcolors (list C_title_unfocused C_title_focused))

      (default-frame
        ;The normal frame type. Includes all decorations, both borders and the title bar.
       `(
  ;Window top border
          ((background . ,ibtbg)            (right-edge . -3) (left-edge . -3)              (height . 19) (top-edge . -19) (class . title))
  ;Window title text
          ((background . ,C_wm_bg_focused)  (right-edge . 77) (left-edge . 17)              (height . 19) (top-edge . -19)
           (foreground . ,ibfgcolors)                (text . ,window-name) (x-justify . center) (y-justify . center) (class . title))

  ;Window close button
          ((background . ,ibtbg)            (right-edge . 1)                  (width . 26)  (height . 19) (top-edge . -19)
           (foreground . ,ibfgcolors) (font . ,ibfnt) (text . "") (x-justify . center) (y-justify . top) (class . close-button))
  ;Window maximize button
          ((background . ,ibtbg)   (right-edge . 26)                  (width . 26) (height . 19) (top-edge . -19)
           (foreground . ,ibfgcolors) (font . ,ibfnt) (text . "") (x-justify . center) (y-justify . top) (class . maximize-button))

  ;Window minimize button
          ((background . ,ibtbg)   (right-edge . 51)                  (width . 26) (height . 19) (top-edge . -19)
           (foreground . ,ibfgcolors) (font . ,ibfnt) (text . "") (x-justify . center) (y-justify . bottom) (class . iconify-button))

  ;Window menu button
          ((background . ,ibtbg)                     (left-edge . 0)  (width . 19) (height . 19) (top-edge . -19)
           (foreground . ,ibfgcolors) (font . ,ibfnt) (text . "") (x-justify . center) (y-justify . center) (class . menu-button))

  ;Right, left and bottom borders
          ((background . ,ibtbg)  (right-edge . -3)                  (width . 3)                (top-edge . 0)   (bottom-edge . -3)  (class . right-border))
          ((background . ,ibtbg)                   (left-edge . -3)  (width . 3)                (top-edge . 0)   (bottom-edge . -3)  (class . left-border))
          ((background . ,ibtbg) (right-edge . 0)  (left-edge . 0)  (height . 3)                                 (bottom-edge . -3)  (class . bottom-border))
        )
      )

      (shaded-frame
        ;A shaded window (normally just the title bar).
       `(
       ;Window top border
               ((background . ,ibtbg)            (right-edge . -3) (left-edge . -3)              (height . 19) (top-edge . -19) (class . title))
       ;Window title text
               ((background . ,C_wm_bg_focused)  (right-edge . 77) (left-edge . 17)              (height . 19) (top-edge . -19)
                (foreground . ,ibfgcolors)                (text . ,window-name) (x-justify . center) (y-justify . center) (class . title))
        )
      )

      (transident-frame
        ;The frame for a transient window. This usually does not include a title bar, but does have all four borders.
       `(
  ;Window top border
          ((background . ,ibtbg)  (right-edge . -3) (left-edge . -3)              (height . 3) (top-edge . -3) (class . top-border))
  ;Right, left and bottom borders
          ((background . ,ibtbg)  (right-edge . -3)                  (width . 3)                (top-edge . 0)   (bottom-edge . -3)  (class . right-border))
          ((background . ,ibtbg)                   (left-edge . -3)  (width . 3)                (top-edge . 0)   (bottom-edge . -3)  (class . left-border))
          ((background . ,ibtbg) (right-edge . 0)  (left-edge . 0)  (height . 3)                                 (bottom-edge . -3)  (class . bottom-border))

        )
      )
    )
    (add-frame-style 'arc-theme
      (lambda (w type)
        (case type
          ((default) default-frame)
          ((transient) transident-frame)
          ((shaped) shaded-frame)
          ((shaped-transient) shaded-frame)
        )
      )
    )
  )
)

(color-changed)
(redefineFrameStyle)
