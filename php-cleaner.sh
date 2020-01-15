# PHP strip comments
# make sure we have the dist
if [ ! -d “dist” ]; then
mkdir dist
fi
# always make this as we delete it after
mkdir middle
# grab everything
for f in *.php
# php cli remove the php comments
php -w $f > $PWD/middle/$f
# go where the files went
cd middle
# grab the new ones
for f in *.php
# remove the html comments
sed 's/<!--.*-->//g' $f > $PWD/../dist/$f
cd ..
# remove the middle state
rm -rf middle
# functions file has a weird behavior so just copy that over
if [ -f functions.php]; then
cp functions.php dist/functions.php
fi