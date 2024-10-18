function display_time_in_status_line () {
/* La fonction affiche la date dans la barre de status du browser*/
	var d=new Date();
	var h=d.getHours();
	var m=d.getMinutes();
	var ampm=(h>=12)?"PM":"AM";
	if (h>12) h-=12;
	if (h==0) h=12;
	if (m<10) m="0"+m;
	var txt='Bienvenue, il est '+h+':'+m+' '+ampm;
	window.status=txt;
    setTimeout("display_time_in_status_line()",1000);
}

function MYRF () {
/* La fonction ne fais rien*/
	var d=new Date();
}