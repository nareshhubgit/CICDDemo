({
    getHubs : function(component) {
        var action=component.get("c.getHubs");
        action.setCallback(this, function(response) {
            var state = response.getState();
            var result = JSON.stringify(response.getReturnValue());
            if (component.isValid() && state === "SUCCESS")
                console.log("Data--"+JSON.stringify(response.getReturnValue()));
                component.set("v.hubsList", response.getReturnValue());  
        });
        $A.enqueueAction(action);
    },
    getDetails : function (component, event, helper) {
        //var recId = event.target.dataset.id;
        var recId = event.getSource().getElement().getAttribute('data-taskid');
        alert("recId--"+recId);
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": recId,
            "slideDevName": "details"
        });
        navEvt.fire();
    }
})