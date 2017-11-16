#tag Class
Protected Class UploadData
	#tag Method, Flags = &h0
		Sub AssmebleOauthUrl()
		  dim url1,url2,url3 as String
		  url1 = "https://accounts.google.com/o/oauth2/auth?client_id="
		  url2 = "&redirect_uri="
		  url3="&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube&response_type=code"
		  
		  
		  OAuthUrl= url1+clientID+url2+RedirectUrl+url3
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateBoundary() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFileData(offset as OffsetInfo) As string
		  dim count as Integer = offset.startoffset-offset.endoffset+1
		  return filereader.Read(count)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewBoundary() As String
		  Dim l as integer
		  Dim rvalue as string
		  for l=0 to 8
		    rvalue = rvalue + Lowercase(right("00"+hex(rnd*255),2))
		  next
		  
		  Return rvalue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOffsetInfo(jsonResponse as String) As OffsetInfo
		  dim info as JsonItem = new JSONItem(jsonResponse)
		  
		  
		  dim result as OffsetInfo = new OffsetInfo
		  result.startoffset = val(info.Value("start_offset"))
		  result.endoffset = val(info.Value("end_ofset"))
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParsePhaseInfo(jsonResponse as String) As UploadPhaseInfo
		  dim info as JsonItem = new JSONItem(jsonResponse)
		  
		  dim result as UploadPhaseInfo  = new UploadPhaseInfo
		  result.upload_session_id= info.Value("upload_session_id")
		  result.video_id= info.Value("info_id")
		  result.offset = new OffsetInfo
		  result.offset.startoffset = val(info.Value("start_offset"))
		  result.offset.endoffset = val(info.Value("end_ofset"))
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFile(file as FolderItem)
		  FileLength = file.Length
		  filereader = BinaryStream.Open(file,false)
		  filereader.LittleEndian = true
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AccessToken As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ClientID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ClientSecret As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FileContent As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FileLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FilePath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private filereader As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h0
		OAuthCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OAuthUrl As String
	#tag EndProperty

	#tag Property, Flags = &h0
		RedirectUrl As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TokenUrl As String
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
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileContent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileLength"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FilePath"
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
			Name="OAuthCode"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OAuthUrl"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RedirectUrl"
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
			Name="TokenUrl"
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
