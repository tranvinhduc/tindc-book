(TeX-add-style-hook "formatAndDefs"
 (lambda ()
    (LaTeX-add-environments
     '("maxime" 1)
     "bulletList"
     "definition"
     "vcenterpage")
    (TeX-add-symbols
     '("reviewtimetoday" 2)
     '("eqRef" 1)
     '("pd" 2)
     "abs"
     "argmax"
     "argmin"
     "diag"
     "headruleORIG"
     "cleardoublepage"
     "minitocORIG")
    (TeX-run-style-hooks
     "slashbox"
     "multirow"
     "algorithmic"
     "noend"
     "algorithm"
     "colortbl"
     "fancyhdr"
     "rotating"
     "color"
     "dvipdfm"
     "hyperref"
     "a4paper"
     "pagebackref"
     "graphicx"
     "pdftex"
     "ifpdf"
     "aecompl"
     "minitoc"
     "tocbibind"
     "nottoc"
     "notlof"
     "notlot"
     "geometry"
     "includefoot"
     "includehead")))

