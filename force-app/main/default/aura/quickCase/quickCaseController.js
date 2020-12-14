({
    handleSuccess : function(cmp, event, helper) {
        cmp.find('notifLib').showToast({
            "variant": "success",
            "title" : "Case Created",
            "message" : "Record ID: " + event.getParam("id")
        });
    }
})
