/* Run the batch file to do work in R first */
options noxwait;
x "myR";

/* Set options for RTF output */
ods rtf file = "test.rtf" nogtitle nogfoot
	/* Titles and footnotes */
	title = 'R graphic image';
ods escapechar='~';
/* Import the image and output into the RTF */
ods text='~S={width=100% preimage="w:\\Iris.png"}';
ods rtf close;

/* ----------------------- */
/* Set options for PDF output */
ods pdf file = "test.pdf" nogtitle nogfoot
	/* Titles and footnotes */
	title = 'R graphic image';
ods escapechar='~';
/* Import the image and output into the RTF */
ods text='~S={width=100% preimage="w:\\iris.png"}';
ods pdf close;";

