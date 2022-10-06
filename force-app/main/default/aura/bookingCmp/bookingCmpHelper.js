({
	getBikeAndBooking : function(component) {
        var recordId = component.get('v.recordId')
		var action=component.get("c.getBike");
        action.setParams({hubId:recordId});
        action.setCallback(this, function(response) {
            var state = response.getState();
            var result = JSON.stringify(response.getReturnValue());
            if (component.isValid() && state === "SUCCESS")
                component.set("v.bookingList", response.getReturnValue());  // Adding values in Aura attribute variable.   
        });
        $A.enqueueAction(action);
	}
})