#tag Class
Protected Class YoutubeClientInfo
Inherits ClientInfo
	#tag Method, Flags = &h0
		Function AssembleOAuthUri() As String
		  return mAuthUri+"client_id="+mClientID+"&redirect_uri="+mRedirectUri+"&scope="+mScope+"&response_type="+mResponseType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssembleToken() As Dictionary
		  Dim d As New Dictionary
		  
		  d.Value("code") = Code
		  d.Value("client_id")= mClientID
		  
		  d.Value("client_secret")=mClientSecret
		  d.Value("redirect_uri")=mRedirectUri
		  d.Value("grant_type") = "authorization_code"
		  
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssembleVideoResource() As String
		  dim snippet As  JSONItem = new JSONItem
		  dim status As JSONItem = new JSONItem
		  
		  dim video as JSONItem = new jsonitem
		  
		  snippet.Value("title")= Title
		  snippet.Value("description")= Description
		  snippet.Value("categoryId")=22
		  
		  video.Value("snippet")=snippet
		  
		  status.Value("privacyStatus")= PrivacyStatus
		  video.Value("status")=status
		  
		  return video.ToString 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  mClientID = "289772526038-ajknqg4lrlt9avhupmlugdk8oa7glvai.apps.googleusercontent.com"
		  mClientSecret = "C9K1JGssIYL8jfJvaxsSpBzZ"
		  mRedirectUri = "urn:ietf:wg:oauth:2.0:oob:auto"
		  mAuthUri = "https://accounts.google.com/o/oauth2/v2/auth?"
		  mTokenUri = "https://www.googleapis.com/oauth2/v4/token"
		  mScope = "https://www.googleapis.com/auth/youtube.upload"
		  mResponseType = "code"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAccessToken()
		  dim MySocket As  new HTTPSecureSocket
		  //MySocket.ConnectionType = 3
		  MySocket.Secure = True
		  MySocket.Yield = true
		  
		  
		  MySocket.ConnectionType = 3
		  
		  
		  
		  MySocket.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
		  
		  
		  
		  
		  Dim d As  Dictionary= AssembleToken
		  
		  
		  
		  MySocket.SetFormData(d)
		  
		  
		  dim url as string  = GetTokenUri
		  
		  
		  
		  dim API_Call_Results As  String=""
		  
		  
		  API_Call_Results =MySocket.Post(url,10)
		  
		  IF API_Call_Results <> "" Then
		    //•MessageBox 
		    Dim ItemToParse as New JSONItem
		    
		    ItemToParse.Load(API_Call_Results)
		    dim TokenResultsDictionary as Dictionary = Common_Module.JSONToDictionary(ItemToParse)
		    
		    AccessToken = TokenResultsDictionary.Lookup("access_token","").StringValue
		  END IF
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseOAuthCode(title as String) As String
		  dim pos As integer = instr(title,"Success code=")
		  if (pos>0) then
		    return title.right(len(title)-len("Success code="))
		  Else
		    return ""
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = Untitled
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		CategoryId As String = "22"
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As String = "this is test"
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

	#tag Property, Flags = &h0
		UploadFileAPI As String = "https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status"
	#tag EndProperty

	#tag Property, Flags = &h0
		UploadFileUrl As String = "https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status"
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessToken"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CategoryId"
			Group="Behavior"
			InitialValue="22"
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
		#tag ViewProperty
			Name="UploadFileAPI"
			Group="Behavior"
			InitialValue="""""https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status"""""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UploadFileUrl"
			Group="Behavior"
			InitialValue="https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
