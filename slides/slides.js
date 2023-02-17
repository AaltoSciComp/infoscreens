/* From https://stackoverflow.com/a/11935263 */
function getRandomSubarray(arr, size) {
    var shuffled = arr.slice(0), i = arr.length, temp, index;
    while (i--) {
        index = Math.floor((i + 1) * Math.random());
        temp = shuffled[index];
        shuffled[index] = shuffled[i];
        shuffled[i] = temp;
    }
    return shuffled.slice(0, size);
}

/* https://stackoverflow.com/a/901144 */
function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

/* Hide elements with class="expire" and lastdate="..." > Date() */
function expireOldItems() {
    now = new Date()
    objects = document.getElementsByClassName('expire');
    for (obj of objects) {
	if (obj.attributes == undefined && ! obj.attributes.includes('expire'))
	    continue
	expireDate = new Date(obj.attributes['expire'].value)
	if (expireDate < now) {
	    obj.hidden = true;
	}
    }

}
