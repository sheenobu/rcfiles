export PATH="$PATH:~/go-bin"

function go-switch-path {
	GOROOT=`nix-env -q --out-path go | awk '{print $2}'`/share/go/
	GOPATH=`readlink -f $1`
	GONAME=`basename $1`
	rm -f ~/go-bin
	ln -sf $GOPATH/bin ~/go-bin
	echo "GOPATH=$GOPATH"
	echo "GOROOT=$GOROOT"
	export GOPATH
	export GONAME
	export GOROOT
}
