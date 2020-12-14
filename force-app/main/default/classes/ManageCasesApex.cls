public with sharing class ManageCasesApex {
    @AuraEnabled(cacheable=true)
    public static List<Case> getOpenCases(Integer numRecords) {
        // Code needed to check for proper access
        String [] caseFields = new String[] {'Id', 'Type', 'Reason', 'Subject', 'Status'};

        Map<String,Schema.SobjectField> caseMap = Schema.SObjectType.Case.fields.getMap();
        for (String fieldToCheck : caseFields) {
            if ( !caseMap.get(fieldToCheck).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }



        List<Case> caseList = [SELECT Id, Type, Reason, Subject, Status FROM Case
            WHERE isClosed = false
            LIMIT : numRecords];

            return caseList;
    }
}
