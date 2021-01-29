version="3.1"
month=$(date +%-m)
offset=1
milestone=$((month-offset))

git clone https://github.com/NaomiProject/Naomi.git
cd Naomi
git checkout naomi-dev
git pull
cd ../
mv Naomi Naomi-$version.M$milestone
zip -r Naomi-$version.M$milestone.zip Naomi-$version.M$milestone
curl -T Naomi-$version.M$milestone.zip -uabcasteel:$BINTRAY_KEY https://api.bintray.com/content/naomiproject/rpi-repo2/Naomi/$version.M$milestone/dev/Naomi-$version.M$milestone.zip?publish=1
