#tag Class
Protected Class Uploader
	#tag Method, Flags = &h0
		 Shared Function CreateFactory(type as String) As IClientFactory
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetShareType(type As string) As string
		  if (type <>"") then 
		    return type
		  end if 
		  
		  SharetoWindow.ShowModal
		  
		  return SharetoWindow.GetType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Shareto(file as folderitem,sharewith As String ="") As Boolean
		  dim clienttype As string = GetShareType(sharewith)
		  if clienttype="" then
		    return false
		  end if
		  
		  dim manager  as IClientFactory = CreateFactory(clienttype)
		  dim oauth2 As OAuth2 = manager.CreateOAuth2
		  
		  OAuthWindow.SetOAuth2Client(oauth2)
		  OAuthWindow.LoadOAuthUrl
		  OAuthWindow.ShowModal
		  
		  if (oauth2.IsPassOAuth2) then
		    dim  client As IUploadClient = manager.CreateClient
		    client.Init(oauth2,file)
		    
		    UploadWindow.DoUpload(client)
		  end if 
		  
		  
		End Function
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
End Class
#tag EndClass
