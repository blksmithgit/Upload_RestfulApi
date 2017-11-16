#tag Class
Protected Class FacebookClient
	#tag Method, Flags = &h0
		Function AssembleVideoResource(fileinfo as UploadFileInfo_Youtube) As String
		  dim snippet As  JSONItem = new JSONItem
		  dim status As JSONItem = new JSONItem
		  
		  dim video as JSONItem = new jsonitem
		  
		  snippet.Value("title")= fileinfo.Title
		  snippet.Value("description")= fileinfo.Description
		  snippet.Value("categoryId")= fileinfo.CategoryId
		  
		  video.Value("snippet")=snippet
		  
		  status.Value("privacyStatus")= fileinfo.PrivacyStatus
		  video.Value("status")=status
		  
		  return video.ToString 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  
		  TokenUri = "https://www.googleapis.com/oauth2/v4/token"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoUpload(file as FolderItem,token as String,url as String) As Boolean
		  
		  dim http As  HTTPSecureSocket= NetHelper.GetSecureSocket
		  
		  Dim binaryStream as BinaryStream = BinaryStream.Open(file, False)
		  dim videodata as String = binaryStream.Read(binaryStream.Length)
		  binaryStream.Close
		  
		  
		  http.SetRequestHeader("Authorization","Bearer "+token)
		  http.SetRequestContent(videodata,"video/*")
		  http.SetRequestHeader("Content-Length", CStr(videodata.Len))
		  
		  
		  // PERFORM SYNCHRONOUS POST
		  Dim API_PutFile_Results_JSONString as String =http.SendRequest("PUT",url,30)
		  
		  //  PARSE JSON RECEIVED RESULTS TO A DICTIONARY
		  Dim ItemToParse as New JSONItem
		  Dim API_PutFile_Results_Dictionary as Dictionary
		  API_PutFile_Results_Dictionary = New Dictionary
		  ItemToParse.Load(API_PutFile_Results_JSONString)
		  API_PutFile_Results_Dictionary = Common_Module.JSONToDictionary(ItemToParse)
		  
		  //Return API_PutFile_Results_Dictionary
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QueryAccessToken(clientid as string,clientsecret as String,authocode as string) As String
		  dim https as HTTPSecureSocket = NetHelper.GetSecureSocket
		  
		  https.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
		  
		  Dim d As New Dictionary
		  d.Value("code") = authocode
		  d.Value("client_id")= clientid
		  d.Value("client_secret")=clientsecret
		  d.Value("redirect_uri")=RedirectUri
		  d.Value("grant_type") = GrantType
		  
		  https.SetFormData(d)
		  
		  dim API_Call_Results As  String=https.Post(TokenUri,3)
		  dim accessToken as String = ""
		  
		  IF API_Call_Results <> "" Then
		    
		    Dim ItemToParse as New JSONItem
		    
		    ItemToParse.Load(API_Call_Results)
		    dim TokenResultsDictionary as Dictionary = Common_Module.JSONToDictionary(ItemToParse)
		    
		    accessToken = TokenResultsDictionary.Lookup("access_token","").StringValue
		    
		  Else
		    
		  END IF
		  
		  return accessToken
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QueryUploadUrl(token as String,file as  folderItem ,uploadinfo as UploadFileInfo_Youtube) As string
		  
		  
		  
		  dim http as  HTTPSecureSocket = NetHelper.GetSecureSocket
		  
		  dim videoResource as String = AssembleVideoResource(uploadinfo)
		  
		  
		  
		  
		  http.SetRequestHeader("Authorization","Bearer "+token)
		  //http.SetRequestHeader("Content-Length",Len(video).ToText)
		  http.SetRequestHeader("X-Upload-Content-Length",Cstr(file.Length))
		  http.SetRequestHeader("x-upload-content-type","video/*")
		  
		  
		  http.SetRequestContent(videoResource,"application/json; charset=utf-8")
		  
		  dim response as string=http.Post(UploadFileApi,10)
		  
		  dim result as string =http.PageHeaders.Value("Location")
		  
		  return result
		  
		  //txtLog.Text = http.PageHeaders.Source()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Upload(oauth as  OAuth2,file as FolderItem,uploadinfo as UploadFileInfo_Youtube) As Boolean
		  dim token As  string = QueryAccessToken(oauth.ClientId,oauth.clientsecret,oauth.Code)
		  
		  dim  url as String = QueryUploadUrl(token,file,uploadinfo)
		  
		  return DoUpload(file,token,url)
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Untitled
		
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected GrantType As String = "authorization_code"
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RedirectUri As String = "urn:ietf:wg:oauth:2.0:oob:auto"
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TokenUri As String = "https://www.googleapis.com/oauth2/v4/token"
	#tag EndProperty

	#tag Property, Flags = &h0
		UploadFileAPI As String = "https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status"
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
			Name="UploadFileAPI"
			Group="Behavior"
			InitialValue="""""https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status"""""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
