base=`dirname $0`
source $base/checks.sh
check_mac

sudo -v
git clone https://github.com/tonsky/FiraCode.git
sudo mv FiraCode/distr/otf/*.otf /Library/Fonts/
rm -rf FiraCode
