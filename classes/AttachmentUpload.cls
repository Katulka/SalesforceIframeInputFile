public with sharing class AttachmentUpload {

	// id of the record to set the attachment to
	private Id parentId;
	private Id getParentId(){
		if(parentId == null){
			parentId = ApexPages.currentPage().getParameters().get('parentId');
			if(parentId == null)
				system.debug('***ERROR - no parentId query string parameter');
		}
		return parentId;
	}

	// the files optional filename
	public String fname {get;set;}
    
    // public attachment variable that the inputfile tag/component will populate
    public Attachment a{
        get{ 
        	if(a == null) 
        		a = new attachment();
        	return a;
        }
        set;
    }

    // helps display styled messaging
    private Boolean messagesPresent;
    public Boolean getMessagesPresent(){        
        return ApexPages.hasMessages();
    }

    // insert the attachment
	public void ProcessAttachment(){
		system.debug('***ProcessAttachment');
	
		if (a.bodyLength < 1 || a.name == null)
			ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please choose a file for upload.'));
		else {

			// if the user provided an optional filename
			if(fname != null && fname != ''){		    
			
				
				//get the file extension if one exists
				List<String> parts = (a.name).split('\\.');
				
				// a.name should contain just a file extension
				a.name = parts[parts.size()-1];
				
				// make sure we append the real filename so it includes proper extension
				a.name = fname + '.' + a.name;
			}

			a.ownerId = UserInfo.getUserId();
			a.parentid = getParentId();

			try {
			    insert a;
			    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully. Click "Choose File" to upload another attachment, or "Close" if you are finished.'));
			} catch(Exception e) {
			    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment.'));
			} finally {
			    a = null;
			    fname = null;
			}
		}
    }
}