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
		Function GetExecuteJavascript() As string
		  return "document.title='zurl '+document.URL;"
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
		  return AccessToken<>""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOAuthResponse(data As  String) As string
		  if instr(data,"zurl")>0 then
		    dim myURL() as string = split(data, "zurl")
		    dim url as string = myUrl(1)
		    
		    Dim parts() as string = split(url, "#")
		    Dim i as Integer = UBound(parts)
		    
		    if Ubound(parts) < 1 then
		      return ""
		    end if
		    
		    
		    parts = split(parts(1), "&")
		    if Ubound(parts) = -1 then
		      return ""
		    end if
		    '
		    Dim tmpString() as string = split(parts(0), "=")
		    AccessToken = tmpString(1)
		    return AccessToken
		    
		    
		  end if
		  return ""
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
