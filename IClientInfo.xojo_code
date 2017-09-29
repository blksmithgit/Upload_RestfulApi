#tag Interface
Protected Interface IClientInfo
	#tag Method, Flags = &h0
		Function GetAuthoCode(title as String) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAuthUri() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClientID() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClientSecret() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRedirectUri() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTokenUri() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetClientID(id as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetClientSecret(secert as String)
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
End Interface
#tag EndInterface
