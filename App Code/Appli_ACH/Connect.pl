#!perl

# Essai de connexion � une base de 
# donn�es avec un objet ADODB

use OLE; # use Win32::OLE if using the Std Distribution

# Cree un objet connexion � partir de ADODB

$Conn = CreateObject OLE "adodb.connection";

# ouvre une connexion sur le serveur O816ACH,SCOTT,TIGER

$Conn->Open("DRIVER={Microsoft ODBC for Oracle};UID=scott;PWD=tiger");

# R�cup�re le r�sultat de la commande SQL dans un recordset

$RS = $Conn->Execute("SELECT * FROM employee");

# format l'affichage pour une page html

print "Content-type: text/html\n\n";

# d�tecte une erreur durant l'ex�cution de la requ�te
if(!$RS) {
	$Errors = $Conn->Errors();
	print "Errors:\n";
	foreach $error (keys %$Errors) {
		print $error->{Description}, "\n";
	}
	die;
}

# Sinon affiche le r�sultat de la requ�te

while ( !$RS->EOF ) {
	my($employee_id, $last_name, $first_name, $middle_initial, $job_id, $manager_id, $hire_date, $salary, $commision, $department_id) = (
		$RS->Fields('EMPLOYEE_ID')->value,
		$RS->Fields('LAST_NAME')->value,
		$RS->Fields('FIRST_NAME')->value,
		$RS->Fields('MIDDLE_INITIAL')->value,
		$RS->Fields('JOB_ID')->value,
		$RS->Fields('MANAGER_ID')->value,
		$RS->Fields('HIRE_DATE')->value,
		$RS->Fields('SALARY')->value,
		$RS->Fields('COMMISSION')->value,
		$RS->Fields('DEPARTMENT_ID')->value );
		print qq!
		<p>$employee_id : $last_name : $first_name : $middle_initial : $job_id : $manager_id : $hire_date : $salary : $commision : $department_id
		</p>!;
		
	$RS->MoveNext;
}

# lib�re l'objet recordset

$RS->Close;

# ferme la connection

$Conn->Close;


