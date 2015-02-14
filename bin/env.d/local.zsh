# Set up the path and library path for opt/local
PATH=`echo $PATH | sed 's#\(.*\)\(:/usr/local/bin\)\(:.*\)#/usr/local/bin:\1\3#'`
export PATH
