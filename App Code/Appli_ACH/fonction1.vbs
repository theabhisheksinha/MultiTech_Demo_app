temp = InputBox("Please enter the temperature in degrees F.", 1)
if temp="" then temp=0

 MsgBox "The temperature is " & Celsius(temp) & " degrees C."

Function Celsius(fDegrees)
	Celsius = (fDegrees - 32) * 5 / 9
End Function