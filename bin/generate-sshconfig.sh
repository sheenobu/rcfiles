
# generate file header
echo "# File generated on `date`" > ~/.ssh/config.generated

# generate file, filter out modelines
cat ~/.ssh/config.d/*.conf | grep -v "vi:" >> ~/.ssh/config.generated

#TODO: test if .ssh/config is a link, if so do nothing. if it is not a link but it does exist, fail!
# link file
ln -sf ~/.ssh/config.generated ~/.ssh/config
