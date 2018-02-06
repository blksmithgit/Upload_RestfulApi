#tag Class
Protected Class YoutubeFactory
Implements IClientFactory
	#tag Method, Flags = &h0
		Function CreateClient() As IUploadClient
		  // 这是接口IClientFactory的一部分。\
		  return new YoutubeClient
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateInfoControl() As IUploadInfoControl
		  // 这是接口IClientFactory的一部分。
		  return new YoutubeInfoControl
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateOAuth2() As OAuth2
		  // 这是接口IClientFactory的一部分。
		  return new YoutubeOAuth2
		End Function
	#tag EndMethod


End Class
#tag EndClass
