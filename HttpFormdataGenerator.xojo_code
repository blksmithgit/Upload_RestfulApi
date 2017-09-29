#tag Class
Protected Class HttpFormdataGenerator
	#tag Method, Flags = &h0
		Sub AddContent(name as String,value As String)
		  Dim content as String = Dash+Boundary+crlf+boundaryHeader+chr(34)+name+chr(34)+crlf+crlf+value+crlf
		  HttpBody = HttpBody + content
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  crlf = chr( 13) + chr( 10 )
		  Boundary = CreateBoundaryID
		  Endline = Dash+Boundary+crlf+ Dash+crlf+crlf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateBoundaryID() As String
		  Dim l as integer
		  Dim rvalue as string
		  for l=0 to 8
		    rvalue = rvalue + Lowercase(right("00"+hex(rnd*255),2))
		  next
		  
		  Return rvalue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBody() As String
		  return HttpBody + Endline
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBoundary() As String
		  return Boundary
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Boundary As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private crlf As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Endline As String
	#tag EndProperty

	#tag Property, Flags = &h0
		HttpBody As String
	#tag EndProperty


	#tag Constant, Name = BoundaryHeader, Type = String, Dynamic = False, Default = \"Content-Disposition: form-data; name\x3D", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Dash, Type = String, Dynamic = False, Default = \"\xE2\x80\x94", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Endline"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HttpBody"
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
