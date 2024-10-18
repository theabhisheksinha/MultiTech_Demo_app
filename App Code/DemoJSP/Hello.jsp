<HTML> 
<HEAD> 
<link rel=stylesheet href=style.css type="text/css"> 
</HEAD> 
<!-- pass a variable to included page --> 
<% request.setAttribute("color", "white"); %> 
<% request.setAttribute("abd", "MYRF"); %> 
<% request.setAttribute("title", "Hello World with Incremental Text Size"); %> 
<p class="sLibelle"> test de la feuille de style</p> 
<% for(int i = 1;i < 8;i++) { %> 
<FONT SIZE=<%=i%>>Hello World</FONT><BR> 
<% } %> 
<% for(int i = 7;i > 0;i--) { %> 
<FONT SIZE=<%=i%>>Hello World</FONT><BR> 
<% } %> 
</BODY> 
</HTML> 
