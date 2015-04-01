public with sharing class AccountDetailExtension {

    private final Account acct;
    
    public AccountDetailExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

    //*** Attachments section
    // List of attachments to show on the view page
    private List<Attachment> Attachments;
    public List<Attachment> getAttachments() {
        if(Attachments == null){
            Attachments = [SELECT Id, ContentType, Owner.Name, Name, createdDate FROM Attachment WHERE parentId =: acct.id ORDER BY createdDate DESC];
            system.debug('***getAttachments, size: ' + Attachments.size());
        }
        return Attachments;
    }

    // required to get the date in to local user local, vf can't do it normally while trying to put special formatting on the time.
    private map<string,string> attachmentdateFormat;
    public map<string,string> getattachmentdateFormat(){
        if(attachmentdateFormat==null){
          attachmentdateformat = new map<string,string>();
            for(Attachment each: getAttachments())
              attachmentdateFormat.put(each.id, each.createdDate.format('MM/dd/yy \'at\' h:mm a'));
        }
        return attachmentdateFormat;
    }

    public void RefreshAttachments(){
        system.debug('***RefreshAttachments');
        Attachments = null;
        attachmentdateFormat = null;
    }



}