#tag Class
Protected Class FacebookClient
	#tag Method, Flags = &h0
		Function AppealUpload(token as String,file as  folderItem) As string
		  
		  dim fileuploader as HTTPSecureSocket = NetHelper.GetSecureSocket
		  
		  dim uploadurl as String = "https://graph-video.facebook.com/v2.3/me/videos"
		  dim formdataCreator as HttpFormdataGenerator = new HttpFormdataGenerator
		  formdataCreator.AddContent("access_token",token)
		  formdataCreator.AddContent("upload_phase","start")
		  
		  dim filelength As String =  cstr(file.length)
		  
		  formdataCreator.AddContent("file_size",filelength)
		  
		  dim body as String = formdataCreator.GetBody()
		  
		  fileuploader.SetRequestContent( body,"multipart/form-data; boundary="+chr(34)+formdataCreator.GetBoundary+chr(34) )
		  
		  dim response as string  = fileUploader.post(uploadurl, 10)
		  return response
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoUpload(file as FolderItem,token as String,appealResult as String) As Boolean
		  dim chunknum as integer = 1
		  dim filename as string = file.Name
		  dim response As string = appealResult
		  
		  dim  filereader as binarystream = BinaryStream.Open(file,false)
		  filereader.LittleEndian = true
		  
		  
		  
		  Try
		    
		    
		    dim phaseInfo as UploadPhaseInfo = ParsePhaseInfo(appealResult)
		    dim offset as OffsetInfo = phaseInfo.offset
		    dim fileuploader as HTTPSecureSocket
		    while (offset.startoffset < file.length)
		      
		      fileuploader  = NetHelper.GetSecureSocket
		      
		      dim formdataCreator as HttpFormdataGenerator  = new HttpFormdataGenerator
		      
		      formdataCreator.AddContent("access_token",token)
		      formdataCreator.AddContent("upload_phase","transfer")
		      dim startoffset as integer = offset.startoffset
		      //if (startoffset<> 0) then 
		      //startoffset = startoffset
		      //end if 
		      
		      formdataCreator.AddContent("start_offset",str(startoffset))
		      formdataCreator.AddContent("upload_session_id",phaseInfo.upload_session_id)
		      
		      dim chunkdata as String = filereader.Read(offset.GetReadCount)
		      
		      formdataCreator.AddFileContent("video_file_chunk",chunkdata,str(chunknum)+filename)
		      chunknum = chunknum +1
		      dim body as string = formdataCreator.GetBody()
		      
		      
		      fileuploader.SetRequestContent( body,"multipart/form-data; boundary="+chr(34)+formdataCreator.GetBoundary+chr(34) )
		      
		      dim response1 as string   = fileUploader.post(UploadFileUri,20)
		      System.DebugLog(response1)
		      
		      offset = ParseOffsetInfo(response1)
		      
		      
		    wend
		    
		    fileuploader  = New HTTPSecureSocket
		    
		    dim formdataCreator as   new HttpFormdataGenerator
		    
		    formdataCreator.AddContent("access_token",token)
		    formdataCreator.AddContent("upload_phase","finish")
		    
		    formdataCreator.AddContent("upload_session_id",phaseInfo.upload_session_id)
		    
		    dim body  as string = formdataCreator.GetBody()
		    fileuploader.SetRequestContent( body,"multipart/form-data; boundary="+chr(34)+formdataCreator.GetBoundary+chr(34) )
		    
		    dim  finishResponse as string   = fileUploader.post(UploadFileUri,20)
		    
		    return ParseResult(finishResponse)
		    
		    
		  Catch t 
		    
		    
		    return false
		  End Try
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOffsetInfo(jsonResponse as String) As OffsetInfo
		  dim info as JsonItem = new JSONItem(jsonResponse)
		  
		  
		  dim result as OffsetInfo = new OffsetInfo
		  result.startoffset = val(info.Value("start_offset"))
		  result.endoffset = val(info.Value("end_offset"))
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParsePhaseInfo(jsonResponse as String) As UploadPhaseInfo
		  dim info as JsonItem = new JSONItem(jsonResponse)
		  
		  dim result as UploadPhaseInfo  = new UploadPhaseInfo
		  result.upload_session_id= info.Value("upload_session_id")
		  result.video_id= info.Value("video_id")
		  result.offset = new OffsetInfo
		  result.offset.startoffset = val(info.Value("start_offset"))
		  result.offset.endoffset = val(info.Value("end_offset"))
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseResult(response as String) As Boolean
		  try
		    
		    dim info as JsonItem = new JSONItem(response)
		    return (info.Value("success") = "true") 
		    
		    
		  catch
		    return false
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Upload(oauth as  OAuth2,file as FolderItem) As Boolean
		  
		  
		  dim  response as String = AppealUpload(oauth.AccessToken,file)
		  
		  if (response<>"") then
		    return DoUpload(file,oauth.AccessToken,response)
		  end if
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Untitled
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		UploadFileUri As String = "https://graph-video.facebook.com/v2.3/me/videos"
	#tag EndProperty


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
		#tag ViewProperty
			Name="UploadFileUri"
			Group="Behavior"
			InitialValue="""""https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status"""""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
