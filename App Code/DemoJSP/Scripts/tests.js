function submit_connection_form( pform )
{
 alert( pform.name );
}

function test_formulaire_connection( pform )
{
  var nbrens = 0;
  var maxFields = 5;
  if ( pform.login.value != "" ) { nbrens = nbrens + 1; }
  if ( pform.password.value != "" )  { nbrens = nbrens + 1; }
  if ( pform.server.value != "" )  { nbrens = nbrens + 1; }
  if ( pform.port.value != "" )  { nbrens = nbrens + 1; }
  if ( pform.sid.value != "" )  { nbrens = nbrens + 1; }
  
  var nbr = maxFields - nbrens;
  
  if ( nbrens < maxFields )
  {
    alert( "Vous avez oublié de renseigner "+nbr+" élément(s) de connection" );
    return;
  }
  else if ( nbrens == maxFields ) 
  {
   pform.submit();
  }
}

function test_sales_form( pform )
{
  var nbrens = 0;

  if ( pform.Qty2.value == "" ) { nbrens = nbrens + 1; alert("Please enter the quantity !"); }
  if ( nbrens == 0 ) 
  {
   pform.submit();
  }
}

function MYRF( )
{
  var i = 0;
}
