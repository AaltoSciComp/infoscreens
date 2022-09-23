OUT=www/
mkdir -p $OUT

# Copy all data to $OUT
rsync -a slides/ $OUT/

# Generat a HTML for all images (even if the image is already used in
# some other slide)
for x in $(find slides/ -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.svg') ; do
    echo image $x
    FILE=$(realpath --relative-to=slides/ "$x")
    cat template-image.html | sed s/IMAGE.png/$FILE/ > www/auto-$FILE.html
done

# Add all HTML files to the index
rm $OUT/index.html
echo "<p>This is not meant for direct consumption; not all of these are active or current.</p>" >> $OUT/index.html
for x in $(find $OUT -name '*.html' ! -name index.html | sort) ; do
    echo indexing html $x
    FILE=$(realpath --relative-to=$OUT "$x")
    echo "<a href=\"$FILE\">$FILE</a><br>" >> $OUT/index.html
done
