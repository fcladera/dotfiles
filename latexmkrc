$dvi_previewer = 'start xdvi -watchfile 1.5';
$ps_previewer  = 'start gv --watch';

# If zero, check for a previously running previewer on the same file and update it.  If nonzero, always start a new previewer.
$new_viewer_always = 0;

# How to make the PDF viewer update its display when the PDF file changes.  See the man page for a description of each method.
$pdf_update_method = 4;
$pdf_update_command = 'cp %R %R_view.pdf';

$pdf_previewer = 'zathura';
$pdflatex = 'pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape  -output-directory=/tmp/Volatile %O %S';
$xelatex = 'xelatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape  -output-directory=/tmp/Volatile %O %S';
$out_dir = '/tmp/Volatile';
