#tag Class
Protected Class YoutubeClientInfo
Inherits ClientInfo
	#tag Method, Flags = &h0
		Function AssembleOAuthUri() As String
		  return mAuthUri+"client_id="+mClientID+"&redirect_uri="+mRedirectUri+"&scope="+mScope+"&response_type="+mResponseType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssembleToken() As Dictionary
		  Dim d As New Dictionary
		  
		  d.Value("code") = Code
		  d.Value("client_id")= mClientID
		  
		  d.Value("client_secret")=mClientSecret
		  d.Value("redirect_uri")=mRedirectUri
		  d.Value("grant_type") = "authorization_code"
		  
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  mClientID = "289772526038-ajknqg4lrlt9avhupmlugdk8oa7glvai.apps.googleusercontent.com"
		  mClientSecret = "C9K1JGssIYL8jfJvaxsSpBzZ"
		  mRedirectUri = "urn:ietf:wg:oauth:2.0:oob:auto"
		  mAuthUri = "https://accounts.google.com/o/oauth2/v2/auth?"
		  mTokenUri = "https://www.googleapis.com/oauth2/v4/token"
		  mScope = "https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube"
		  mResponseType = "code"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOAuthCode(title as String) As String
		  dim pos As integer = instr(title,"Success code=")
		  if (pos>0) then
		    return title.right(len(title)-len("Success code="))
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
