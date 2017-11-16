#tag Class
Protected Class UploadFileInfo_Youtube
	#tag Note, Name = Untitled
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		CategoryId As Integer = 22
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As String = "this is test"
	#tag EndProperty

	#tag Property, Flags = &h0
		File As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		PrivacyStatus As String = "public"
	#tag EndProperty

	#tag Property, Flags = &h0
		Tags As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CategoryId"
			Group="Behavior"
			InitialValue="22"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			InitialValue="this is test"
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
			Name="PrivacyStatus"
			Group="Behavior"
			InitialValue="""""public"""""
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
			Name="Tags"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
