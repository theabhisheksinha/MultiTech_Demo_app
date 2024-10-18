#!perl

# utilise une bibliothèque qui contient la fonction ReadParse
# cette fonction récupère les données envoyées aux pages serveur par la méthode
# GET ou la méthode PUT et renvoie les données sous la forme d'un tableau

require "cgi-lib.pl";
&ReadParse(*form_data);
# crée une procédure qui ferme la fenêtre 
# après un temps d'arret (utilise un script Javascript
# dans un print de la page html)
sub proc1 {
	print qq!
	<script language="Javascript">
	var i=0;
	while (i<2000000) {
		i++;
	}
	var nom=window.name;
	window.open("connect.pl",nom);
	</script>!;
}

# crée la form qui permet de rentrer les données (si elles n'éxistent pas)
# ou affiche le résultat de l'analyse sous la forme d'une page HTML 
print "Content-type: text/html\n\n";
if ($form_data{'submit'} eq "")
	{
	print qq!
	<html>
	<head>
	<title>Testing Form Input</title>
	</head>
	<script language="Javascript" src=time.js></script>
	<body>
	<form method="POST" action="essai1.pl">
	<center>
	<table border="1">
	<tr>
	<th>First Name</th>
	<td><input type="text" name="f_name"></td>
	</tr>
	
	<tr>
	<th>Last Name</th>
	<td><input type="text" name="l_name"></td>
	</tr>

	<tr>
	<th>Email</th>
	<td><input type="text" name="email"></td>
	</tr>

	</table>
	<p>
	<input type="submit" name="submit">
	</center>
	</form>
	</body>
	</html>!;
	exit;
	}
else
	{
	print qq!
	<html>
	<head>
	<title>Testing Form Input</title>
	</head>
	<script language="Javascript" src=time.js></script>
	<body>
	<table>!;

	foreach $key (keys(%form_data))
		{
		print qq!
		<tr>
		<td>$key</td>
		<td>$form_data{$key}</td>
		</tr>!;
		}
	print qq!
	</table>!;
	proc1;
	
	print qq!
	</body>
	</html>!;
	}
