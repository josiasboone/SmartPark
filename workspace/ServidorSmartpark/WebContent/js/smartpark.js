var localPrincipal;

function getURLParameter(url,nome) {
	return getURLParameters(url)[nome];
}

function getURLParameters() {
	return getURLParameters(window.location.href);
}

function getURLParameters(url) {

	var result = {};
	var searchIndex = url.indexOf("?");
	if (searchIndex == -1)
		return result;
	var sPageURL = url.substring(searchIndex + 1);
	var sURLVariables = sPageURL.split('&');
	for ( var i = 0; i < sURLVariables.length; i++) {
		var sParameterName = sURLVariables[i].split('=');
		result[sParameterName[0]] = sParameterName[1];
	}
	return result;
}



