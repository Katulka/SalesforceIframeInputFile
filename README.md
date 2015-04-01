# SalesforceIframeInputFile
Apex:InputFile loaded through an IFrame in a Bootstrap Modal with cross-IFrame functionality.

This is a sample Salesforce page that shows how to encapsulate the Apex:InputFile functionality within an iframe, separating it from the parent page. The reason for doing this is because of the limitation of having an InputFile tag on a visualforce, you may run into this error:

  apex:inputFile can not be used in conjunction with an action component, apex:commandButton or apex:commandLink that specifies a rerender or oncomplete attribute

See article for full explanation of solution(s): <a href="http://blog.crmscience.com/2015/04/salesforce1-mobile-fun-with-iframes.html" target="_blank">Salesforce1 Mobile &amp; Fun with IFrames</a>
