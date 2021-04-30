echo "Installing Dependencies"
sudo apt-get -y install git rcs make makepasswd cpanminus apt-file

sudo apt-get -y install gcc libssl-dev libauthen-ntlm-perl \
     libclass-load-perl libcrypt-ssleay-perl liburi-perl \
     libdata-uniqid-perl libdigest-hmac-perl libdist-checkconflicts-perl \
     libfile-copy-recursive-perl libio-compress-perl libio-socket-inet6-perl \
     libio-socket-ssl-perl libio-tee-perl libmail-imapclient-perl \
     libmodule-scandeps-perl libnet-ssleay-perl libpar-packer-perl \
     libreadonly-perl libsys-meminfo-perl libterm-readkey-perl \
     libtest-fatal-perl libtest-mock-guard-perl libtest-pod-perl \
     libtest-requires-perl libtest-simple-perl libunicode-string-perl \
     libencode-imaputf7-perl libfile-tail-perl libregexp-common-perl \
     libregexp-common-email-address-perl libregexp-common-perl \
     libregexp-common-time-perl libtest-deep-fuzzy-perl libtest-deep-perl \
     libtest-deep-json-perl libtest-deep-perl libtest-deep-type-perl \
     libtest-deep-unorderedpairs-perl libtest-modern-perl libtest-most-perl

echo "Installing required Python modules using CPAN"
sudo cpanm Crypt::OpenSSL::RSA Crypt::OpenSSL::Random --force
sudo cpanm Mail::IMAPClient JSON::WebToken Test::MockObject 
sudo cpanm Unicode::String Data::Uniqid

echo "Downloading and building imapsync"
git clone https://github.com/imapsync/imapsync.git

apt-file update

cd imapsync
mkdir -p dist
sudo make install
