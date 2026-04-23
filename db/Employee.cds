namespace btp.trg;

using {cuid, managed} from '@sap/cds/common';

entity Employee: cuid, managed {
    // empid: String(20) @mandatory;
    NAME: String(20) @mandatory;
    EMAIL_ID : String(30);
    DEPARTMENT: String(30);
    SALARY: Integer;
    STATUS: String(30);
}

entity Department: cuid {
    NAME: String(30);
}