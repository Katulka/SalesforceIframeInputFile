# SalesforceIframeInputFile
Apex:InputFile loaded through an IFrame in a Bootstrap Modal with cross-IFrame functionality.

This is a sample Salesforce page that shows how to encapsulate the Apex:InputFile functionality within an iframe, separating it from the parent page. The reason for doing this is because of the limitation of having an InputFile tag on a visualforce, you may run into this error:

  apex:inputFile can not be used in conjunction with an action component, apex:commandButton or apex:commandLink that specifies a rerender or oncomplete attribute

There is one solution out there (using an ActionRegion tag to wrap your buttons/functions) that worked initially but as my page grew, the InputFile component broke. The component stopped firing the setter for my Attachment property. It felt more like a hack solution anyway. I needed to encapsulate it so that I could code with freedom on the main page.

I also didn't want to redirect the page, so I needed a nice modal where user uploads attachment (like I had before) but they don't know it's through an IFrame.

<a href="http://mkdemos-developer-edition.na17.force.com/apex/AccountDetail?id=001o000000Sp1vS" target="_blank"><strong>Demo Link</strong></a>


<strong>KEYS to the solution:</strong> 

<i>AccountDetail page<i>
- Contains an IFrame with id = "attachmentIFrame"
- Contains the submit button as part of the modal. It fires a javascript function from within the iframe to insert the attachment.
- Contains a close button which is unlimited and able to call an actionFunction which does contain an oncomplete rule (which navigates the user to the attachments tab list).

<i>AttachmentUpload page</i>
- Contains the Apex:InputFile tag, and has an accessible javascript/actionFunction called "processAttachment". This is the function that the parent page will call.

By separating the inputFile tag, you can use rerender or oncomplete attributes on the parentpage again, without the need for actionRegion tags (actionRegion may or may not work for you, worth a try).


Styling is done with the BootstrapSF1 package and the Bootstrap Javascript library to match. This will work in Salesforce1.
