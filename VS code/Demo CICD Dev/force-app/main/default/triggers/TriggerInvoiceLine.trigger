trigger TriggerInvoiceLine on Invoice_Line_Item__c (After insert,After update) {
    set<id> newsetid= new set<id>();
    set<id> oldsetid= new set<id>();
    for(Invoice_line_item__c inv:Trigger.New){
        if(inv.Invoice_Item_cost__c!=null){
            newsetid.add(inv.Invoice__c);
        }
    }
    if(trigger.isupdate){
    for(Invoice_line_item__c invold:Trigger.old){
        if(invold.Invoice_Item_cost__c!=null){
            oldsetid.add(invold.Invoice__c);
        }
    }
    }
    list<invoice__c> invlist=[select id,Invoice_Amount__c,Invoice_line_items__c,(select id,name,Invoice_Item_cost__c 
                                                                                 from Invoice_line_item__r WHERE id IN:Trigger.new) 
                              from Invoice__c WHERE id IN:newsetId];
    list<invoice__c> involdlist=[select id,Invoice_Amount__c,Invoice_line_items__c,(select id,name,Invoice_Item_cost__c 
                                                                                    from Invoice_line_item__r WHERE id IN:Trigger.old) 
                                 from Invoice__c WHERE id IN:oldsetId];
    if(Trigger.isinsert){
        for(Invoice__c i:invlist){
            i.Invoice_line_items__c= i.Invoice_line_items__c+1;
            for(Invoice_line_item__c inv:i.invoice_line_item__r){
                i.Invoice_Amount__c=i.Invoice_Amount__c+inv.Invoice_Item_cost__c;
                
            }
        }   
    }
    if(Trigger.isUpdate){
        for(Invoice__c i:invlist){
            for(Invoice_line_item__c inv:i.invoice_line_item__r){
                for(Invoice__c j:involdlist){
                    for(Invoice_line_item__c k:j.invoice_line_item__r){
                        i.Invoice_Amount__c=i.Invoice_Amount__c+inv.Invoice_Item_cost__c-k.Invoice_Item_cost__c;
                    }
                }
            }
        }
    }
    update invlist;  
}