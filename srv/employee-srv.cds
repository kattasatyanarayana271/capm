using btp.trg as emp from '../db/Employee';

service EmployeeService {

    @odata.draft.enabled

    entity Employee   as select from emp.Employee;

    entity Department as select from emp.Department;
}

annotate EmployeeService.Employee with @(
    UI: {
    LineItem: [
        {
            $Type: 'UI.DataField',
            Value: NAME
        },
        {
            $Type: 'UI.DataField',
            Value: EMAIL_ID
        },
        {
            $Type: 'UI.DataField',
            Value: DEPARTMENT
        },
        {
            $Type: 'UI.DataField',
            Value: SALARY
        },
         {
            $Type: 'UI.DataField',
            Value: STATUS
        },
    ],
    FieldGroup #BasicData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: NAME,
                Label: 'Name'
            },
            {
                $Type: 'UI.DataField',
                Value: EMAIL_ID,
                Label: 'Email ID'
            },
            {
                $Type: 'UI.DataField',
                Value: DEPARTMENT,
                Label: 'Department'
            },
            {
                $Type: 'UI.DataField',
                Value: SALARY,
                Label: 'Salary'
            },
            {
                $Type: 'UI.DataField',
                Value: STATUS,
                Label: 'Status'
            }
        ]
    },
    FieldGroup #AdminData: {
        $Type: 'UI.FieldGroupType',

        Data : [
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedBy
            }
        ]
    },
    Facets               : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#BasicData',
            Label : 'General Information',
            ID    : 'idBasicData'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#AdminData',
            Label : 'Additional Information',
            ID    : 'idAdditionalData'
        }
    ]

});
