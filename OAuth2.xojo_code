#tag Class
Protected Class OAuth2
	#tag Method, Flags = &h0
		Sub constructor(provider as string, clientKey as string, clientSecret as String)
		  Self.provider = provider
		  Self.clientKey = clientKey
		  Self.clientSecret = clientSecret
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getUserInformation(Optional fields() as String) As JSONItem
		  Dim json as JSONItem=nil
		  Dim http as new HTTPSecureSocket
		  
		  Dim url as string 
		  
		  if fields = nil then
		    fields = Array("id", "name")
		  end if
		  
		  url = "https://graph.facebook.com/me?access_token&fields=" +EncodeURLComponent(join(fields, ",")) + _
		  "&access_token=" + Self.accessToken
		  
		  Try
		    Dim content as String = http.get(url, 5)
		    json = new JSONItem(content)
		  Catch t 
		    
		  End Try
		  
		  return json
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
		  Self.expired = val(tmpString(1))
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UploadFile() As string
		  dim  AccessToken as String = ""
		  
		  dim fileuploader as HTTPSecureSocket = New HTTPSecureSocket
		  
		  dim formdataCreator as HttpFormdataGenerator = new HttpFormdataGenerator
		  formdataCreator.AddContent("access_token",AccessToken)
		  formdataCreator.AddContent("upload_phase","start")
		  
		  dim filelength As String =  str(App.uploadfile.FileLength)
		  
		  formdataCreator.AddContent("file_size",filelength)
		  
		  dim body as String = formdataCreator.GetBody()
		  
		  fileuploader.SetRequestContent( body,"multipart/form-data; boundary="+chr(34)+formdataCreator.GetBoundary+chr(34) )
		  
		  dim response as string  = fileUploader.post("https://graph-video.facebook.com/me/videos", 10)
		  
		  Try
		    
		    //dim uploadinfo as JsonItem = new JSONItem(response)
		    dim phaseInfo as UploadPhaseInfo =  App.uploadfile.ParsePhaseInfo(response)
		    dim offset as OffsetInfo = phaseInfo.offset
		    
		    while (offset.startoffset < App.uploadfile.filelength)
		      
		      fileuploader  = New HTTPSecureSocket
		      
		      formdataCreator  = new HttpFormdataGenerator
		      
		      formdataCreator.AddContent("access_token",AccessToken)
		      formdataCreator.AddContent("upload_phase","transfer")
		      dim startoffset as integer = offset.startoffset
		      //if (startoffset<> 0) then 
		      //startoffset = startoffset
		      //end if 
		      
		      formdataCreator.AddContent("start_offset",chr(startoffset))
		      formdataCreator.AddContent("upload_session_id",phaseInfo.upload_session_id)
		      
		      dim chunkdata as String = App.uploadFile.GetFileData(offset)
		      
		      formdataCreator.AddContent("video_file_chunk",chunkdata)
		      
		      body = formdataCreator.GetBody()
		      
		      fileuploader.SetRequestContent( body,"multipart/form-data; boundary="+chr(34)+formdataCreator.GetBoundary+chr(34) )
		      
		      dim response1 as string   = fileUploader.post("https://graph-video.facebook.com/me/videos",10)
		      
		      
		      offset = App.uploadfile.ParseOffsetInfo(response1)
		      
		      
		    wend
		    
		    fileuploader  = New HTTPSecureSocket
		    
		    formdataCreator  = new HttpFormdataGenerator
		    
		    formdataCreator.AddContent("access_token",AccessToken)
		    formdataCreator.AddContent("upload_phase","finish")
		    
		    formdataCreator.AddContent("upload_session_id",phaseInfo.upload_session_id)
		    
		    
		    fileuploader.SetRequestContent( body,"multipart/form-data; boundary="+chr(34)+formdataCreator.GetBoundary+chr(34) )
		    
		    dim nextoffset as string   = fileUploader.post("https://graph-video.facebook.com/me/videos",10)
		    
		    offset = App.uploadfile.ParseOffsetInfo(nextoffset)
		    
		    
		  Catch t 
		    
		  End Try
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		accessToken As String
	#tag EndProperty

	#tag Property, Flags = &h0
		clientKey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		clientSecret As string
	#tag EndProperty

	#tag Property, Flags = &h0
		expired As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		File As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		FileLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		provider As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="accessToken"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="clientKey"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="clientSecret"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="expired"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="provider"
			Group="Behavior"
			Type="string"
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
