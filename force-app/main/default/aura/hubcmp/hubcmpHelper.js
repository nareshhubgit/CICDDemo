({
	getHubs : function(component) {
		var action=component.get("c.getHubs");
         action.setCallback(this, function(response) {
            var state = response.getState();
            var result = JSON.stringify(response.getReturnValue());
            if (component.isValid() && state === "SUCCESS")
                component.set("v.hubsList", response.getReturnValue());  // Adding values in Aura attribute variable.   
        });
        $A.enqueueAction(action);
	}
})