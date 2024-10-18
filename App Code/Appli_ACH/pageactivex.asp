<html>
<script language="VBScript" runat=server>
dim object
object = server.CreateObject(Excel.Application)
object.AddCustomList(10, 2) = 10
Dim toto
Dim objet2 
set objet2 = server.createobject("Appview.VBListener")
If (objet2.OnFire = 0) Then
    toto = 10
End If

	' lien vers l'activeX activeMovie
Dim activemovie
activemovie = server.CreateObject("QuartzTypeLib.FilgraphManager")
activemovie.Pause = 10
activemovie.FilterCollection

Dim titi 
dim authors
titi= server.createobject("ActiveMovie")
titi.AboutBox = 10
authors = titi.Author

</script>
<body>
La page a fait un lien vers une application Excel pars un activeX
</body>
</html>  