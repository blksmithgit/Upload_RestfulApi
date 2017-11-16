#tag Class
Protected Class OffsetInfo
	#tag Method, Flags = &h0
		Function IsComplete() As Boolean
		  return startoffset=endoffset  and endoffset<>0
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		endoffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		startoffset As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="endoffset"
			Group="Behavior"
			Type="Integer"
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
			Name="startoffset"
			Group="Behavior"
			Type="Integer"
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
