trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account a : Trigger.new){
        if(a.Match_Billing_Address__c == True && a.BillingPostalCode != null){
            a.ShippingStreet = a.BillingStreet;
            a.ShippingCity = a.BillingCity;
            a.ShippingState = a.BillingState;
            a.ShippingCountry = a.BillingCountry;
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}