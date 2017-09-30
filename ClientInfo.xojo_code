#tag Class
Protected Class ClientInfo
Implements IClientInfo
	#tag Method, Flags = &h0
		Function AssembleOAuthUri() As String
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssembleToken() As Dictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAuthUri() As String
		  // 这是接口IClientInfo的一部分。
		  
		  return mAuthUri
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClientID() As String
		  // 这是接口IClientInfo的一部分。
		  
		  return mClientID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClientSecret() As String
		  // 这是接口IClientInfo的一部分。
		  
		  return mClientSecret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRedirectUri() As String
		  // 这是接口IClientInfo的一部分。
		  
		  return mRedirectUri
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTokenUri() As String
		  // 这是接口IClientInfo的一部分。
		  
		  return mTokenUri
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOAuthCode(title as String) As String
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetClientID(id As String)
		  // 这是接口IClientInfo的一部分。
		  
		  mClientID = id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetClientSecret(secret as String)
		  // 这是接口IClientInfo的一部分。
		  
		  mClientSecret = secret
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AccessToken As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Code As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mAuthUri As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mClientID As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mClientSecret As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mRedirectUri As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mResponseType As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mScope As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTokenUri As String
	#tag EndProperty

	#tag Property, Flags = &h0
		RefreshToken As String
	#tag EndProperty


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
