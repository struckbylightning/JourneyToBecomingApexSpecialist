@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {  
    @HttpGet
    global static account getAccount() {        
        RestRequest request = RestContext.request;        
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')-18,
                                                        request.requestURI.lastIndexOf('/'));
        List<Account> a = [select id, name, (select id, name from contacts) from account where id = :accountId];
        return a[0];        
    }
    
}