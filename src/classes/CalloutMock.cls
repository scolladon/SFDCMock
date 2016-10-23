@isTest
global class CalloutMock implements HttpCalloutMock {

  global HttpResponse respond(HttpRequest aRequest) {
    HttpResponse aResp = new HttpResponse();
    
    CalloutMock__mdt acm = [Select JSON__c, StatusCode__c from CalloutMock__mdt where Endpoint__c =:aRequest.getEndpoint() limit 1];
    
    aResp.setBody(acm.JSON__c);
    aResp.setStatusCode(Integer.valueOf(acm.StatusCode__c));
    return aResp;
  }
}