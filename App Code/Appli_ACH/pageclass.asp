<html>
<body>
<script language="VBSCRIPT" runat="server">
class maclass	
	private	field_private
	public	field_public
	
	Public Sub Class_Initialize()
		field_private="private"
		field_public="public"
	End Sub
	
	Public Property let myproperty_public(para1)
		field_public = para1
	End property
	
	Public Property set myproperty_public(para1)
		field_public = para1
	End property
	
	Public Property get myproperty_public()
		myproperty_public = field_public
	End property
	
	private function retour_valeur (toto)
		retour_valeur = toto
	end function
	
	private sub test_lien_interne
		dim toto
		dim titi
		toto=1
			' lien vers une fonction
		titi = retour_valeur (maclass.field_public)
			' lien vers une property let
		myproperty_public(titi)
			' lien vers une property set
		myproperty_public("public")
			' lien vers une property get
		toto = myproperty_public()
		
	end sub		
	
	
end class
</script>
</body>
</html>
