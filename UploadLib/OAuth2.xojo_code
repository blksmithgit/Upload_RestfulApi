#tag Class
Protected Class OAuth2
	#tag Method, Flags = &h0
		Function GetExecuteJavascript() As string
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOAuth2Url() As string
		  dim url as string = OAuthUri+"client_id="+ClientID+"&redirect_uri="+RedirectUri+"&scope="+Scope+"&response_type="+ResponseType
		  return url
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPassOAuth2() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOAuthResponse(url as String) As string
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AccessToken As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ClientID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ClientSecret As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Code As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OAuthUri As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RedirectUri As String
	#tag EndProperty

	#tag Property, Flags = &h0
		RefreshToken As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ResponseType As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Scope As String
	#tag EndProperty


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
