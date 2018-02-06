#tag Module
Protected Module Upload_Common
	#tag Method, Flags = &h0
		Function JSONToArray(data As JSONItem) As Variant()
		  dim r() as Variant
		  
		  
		  dim ub as integer = data.Count - 1
		  for i as integer = 0 to ub
		    dim value as Variant = data( i )
		    
		    if value IsA JSONItem then
		      
		      dim j as JSONItem = JSONItem( value )
		      if j.IsArray then
		        r.Append JSONToArray( j )
		      else
		        // NEED TO CHECK FOR ERROR KEY
		        r.Append JSONToDictionary( j )
		      end if
		      
		    else
		      
		      r.Append value
		      
		    end if
		    
		  next i
		  
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JSONToDictionary(inJSONItem as JSONItem) As Dictionary
		  // THIS FUNCTION TAKES INPUT FROM A DIRECTORY AND RETURNS A DIRECTORY
		  
		  dim r as new Dictionary
		  
		  dim names() as string = inJSONItem.Names
		  
		  for each name as string in names
		    
		    dim value as Variant  = inJSONItem.Value( name )
		    
		    if value IsA JSONItem then
		      
		      dim j as JSONItem = JSONItem( value )
		      
		      if j.IsArray then
		        r.Value( name ) = JSONToArray( j )
		        
		        'else
		        r.Value( name ) = JSONToDictionary( j )
		      end if
		      
		    else
		      r.Value( name ) = value
		      
		    end if
		    
		  next
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseCode(PageContent as String)
		  // PARSE CODE
		  Dim Parse_AccessCode_RegEx as RegEx
		  Dim Parse_AccessCode_RegExMatch as RegExMatch
		  Dim Parse_AccessCode_HitText as String
		  Parse_AccessCode_RegEx = New RegEx
		  Parse_AccessCode_RegEx.Options.CaseSensitive = False
		  Parse_AccessCode_RegEx.Options.Greedy = True
		  Parse_AccessCode_RegEx.Options.StringBeginIsLineBegin = True
		  Parse_AccessCode_RegEx.Options.StringEndIsLineEnd = True
		  Parse_AccessCode_RegEx.Options.MatchEmpty = True
		  Parse_AccessCode_RegEx.Options.TreatTargetAsOneLine = False
		  Parse_AccessCode_RegEx.SearchPattern = "(?<=\?code=).+"
		  
		  Parse_AccessCode_RegExMatch = Parse_AccessCode_RegEx.Search(PageContent)
		  
		  //if Parse_AccessCode_RegExMatch <> nil and not parsenotok then
		  //Parse_AccessCode_HitText = Trim(Parse_AccessCode_RegExMatch.SubExpressionString(0))
		  //Common_Module.DropboxOAUTHSocket.Dropbox_Access_Code = Parse_AccessCode_HitText
		  //parsenotok = True
		  //HTMLViewer1.Enabled = True
		  //HTMLViewer1.Visible = True
		  //else
		  //HTMLViewer1.ExecuteJavaScript("location.reload();")
		  //end if
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = Facebook, Type = String, Dynamic = False, Default = \"Facebook", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Youtube, Type = String, Dynamic = False, Default = \"Youtube", Scope = Public
	#tag EndConstant


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
End Module
#tag EndModule
