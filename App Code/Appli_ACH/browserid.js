// BrowserID JavaScript (C)1997 Cyril Pannetier - La Petite Boutique JavaScript -
// web : http://www.mygale.org/08/pannetie
// e-mail : pannetie@mygale.org
// Ce script est librement utilisable. Merci de ne pas effacer ces commentaires.

function browserID() {
		// Vérification de la version du navigateur internet
	var name = navigator.appName ;
	var version = navigator.appVersion;

	if (name == 'Netscape') {
		// Si c'est Netscape
		name = 'Netscape Navigator';
		version = navigator.appVersion.substring(0,5);
	}
	else {
			// Sinon c'est peut-être IE
		if (name == 'Microsoft Internet Explorer') {
			id = version.indexOf('MSIE');
			version = version.substring(id+5,id+9);
		}
		else {
				// Sinon on ne connait pas
			name = 'Navigateur inconnu';
			version = '0.00';
		}
	}
	ID = name + ' ' + version;

	return ID; // retour de la fonction BROWSERID
}