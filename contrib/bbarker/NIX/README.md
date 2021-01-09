
## Building ATS-Xanadu from a git repository

Please clone the ATS-Xanadu repo to a desired
location. For instance,

1. `cd /tmp`
2. `git clone https://github.com/githwxi/ATS-Xanadu.git`

Please set the environment variable XATSHOME as follows:

3. `export XATSHOME=/tmp/ATS-Xanadu`

You can now build ATS-Xanadu by executing the following
command-lines:

4. `cd ${XATSHOME}`
5. `nix-shell share/NIX/shell.nix`
6. `(cd srcgen/xats && make all && cp xatsopt ./../../bin)`

If the build is successful, you should be able to find
the command `xatsopt` in ${XATSHOME}/bin:

7. `ls -al ${XATSHOME}/bin`
