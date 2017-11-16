#tag Class
Protected Class FacebookOAuth2
Inherits OAuth2
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  ClientID = "680759765417693"
		  ClientSecret = "716948191364995210fb91988316f524"
		  
		  
		  OAuthUri = "https://www.facebook.com/v2.8/dialog/oauth?"
		  Scope = "publish_actions"
		  RedirectUri = "https://www.facebook.com/connect/login_success.html"
		  ResponseType = "token"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOAuth2Url() As String
		  dim url as string = OAuthUri+"client_id="+ClientID+"&redirect_uri="+RedirectUri+"&scope="+Scope+"&response_type="+ResponseType
		  return url
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isComplete(url as string) As Boolean
		  Dim parts() as string = split(url, "#")
		  Dim i as Integer = UBound(parts)
		  
		  if Ubound(parts) < 1 then
		    return false
		  end if
		  
		  
		  parts = split(parts(1), "&")
		  if Ubound(parts) = -1 then
		    return false
		  end if
		  
		  Dim tmpString() as string = split(parts(0), "=")
		  Self.accessToken = tmpString(1)
		  
		  tmpString() = split(parts(1), "=")
		  //Self.expired = val(tmpString(1))
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPassOAuth2() As Boolean
		  return Code<>""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NeedExecuteJavascript() As Boolean
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOAuthResponse(data As  String) As string
		  dim pos As integer = instr(data,"Success code=")
		  if (pos>0) then
		    Code= data.right(len(data)-len("Success code="))
		    return Code
		  Else
		    return ""
		  end if
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessToken"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientID"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientSecret"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Code"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OAuthUri"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RefreshToken"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
