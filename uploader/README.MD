#WiPy File uploader
The WiPy and LoPy are wonderful, nifty systems but they can let down the most determined programmer with their code upload cycle: write - ftp on flash - console 
Pycom is currently developing an IDE that makes this process somewhat easier, however...
- Not everyone is an "IDE guy", I , for one, love VI
- Their IDE is far from being reliable
- Sometimes all you have is a console

Hence I wrothe this short, crude script to be able to upload a file from VI

One can invoke the script from any BASH shell (OSX users, please comment the 'passive' command as mentioned in the script) or from VI directly, provided changes are saved beforehand (see hereunder).

While on VI (command mode), script in current directory:
```
:w	
								# Save your current changes
:! ./WP-up.sh -f % -s 192.168.1.1	# Invoke the script, upload edited file
```

A similar action can be performed in Emacs, using the embedded shell:
 
```
M-! ./WP-up.sh -f filename
```

