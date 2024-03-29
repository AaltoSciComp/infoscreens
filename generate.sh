OUT=www/
mkdir -p $OUT

# Check duplicate names
for x in slides/*.html ; do
    if [ -e "${x%%.html}.png" ]; then
	echo "Error: $x and ${x%%.html}.png both exist - the second will be overwridden" 1>&2
	exit 1
    fi
done

# Copy all data to $OUT
rsync -a slides/ $OUT/

# Generat a HTML for all images (even if the image is already used in
# some other slide)
#for x in $(find slides/ -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.svg') ; do
#    echo image $x
#    FILE=$(realpath --relative-to=slides/ "$x")
#    cat template-image.html | sed s/IMAGE.png/$FILE/ > www/auto-$FILE.html
#done

# Make screenshots
python screenshot.py $OUT/*.html

# Add all HTML files to the index
rm $OUT/index.html
echo "<p>This is not meant for direct consumption; not all of these are active or current - the deployer should know which are relevant.  Also, use the local mirror for the actual screens, ask Richard or someone in scicomp for the link.  Last update: $(date)</p>" >> $OUT/index.html
for x in $(find $OUT -name '*.html' ! -name index.html | sort) ; do
    echo indexing html $x
    FILE=$(realpath --relative-to=$OUT "$x")
    echo "<a href=\"$FILE\">$FILE</a> (<a href=\"${FILE%%.html}.png\">image</a>)<br>" >> $OUT/index.html
done
