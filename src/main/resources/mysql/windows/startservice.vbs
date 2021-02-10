script = WScript.Arguments.Item(0)
param0 = WScript.Arguments.Item(1)
param1 = WScript.Arguments.Item(2)
param2 = WScript.Arguments.Item(3)

CreateObject("Wscript.Shell").Run """" & script & """ """ & param0 & """ """ & param1 & """ """ & param2 & """ >NUL", 0, False
