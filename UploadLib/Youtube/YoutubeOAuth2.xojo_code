#tag Class
Protected Class YoutubeOAuth2
Inherits OAuth2
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  ClientID = "289772526038-ajknqg4lrlt9avhupmlugdk8oa7glvai.apps.googleusercontent.com"
		  ClientSecret = "C9K1JGssIYL8jfJvaxsSpBzZ"
		  
		  
		  OAuthUri = "https://accounts.google.com/o/oauth2/v2/auth?"
		  
		  Scope = "https://www.googleapis.com/auth/youtube.upload"
		  RedirectUri = "urn:ietf:wg:oauth:2.0:oob:auto"
		  ResponseType = "code"
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
		  return false
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
