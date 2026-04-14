namespace btp.trg;

using {cuid, managed} from '@sap/cds/common';

entity Employee: cuid, managed {
    // empid: String(20);
    NAME: String(20);
    EMAIL_ID: String(30);
    DEPARTMENT: String(30);
}

entity Department: cuid {
    NAME: String(30);
}