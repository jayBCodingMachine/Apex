trigger CaseTrigger on Case (before insert, before update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT, BEFORE_UPDATE {
            CaseTriggerHandler.relateContacts(Trigger.new);
        }
    }
}