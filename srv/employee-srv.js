const cds = require('@sap/cds');

class EmployeeService extends cds.ApplicationService {

    init() {

        const { Employee } = this.entities;

        this.before(['CREATE', 'UPDATE'], Employee, this.checkValidation);
        this.before('DELETE', Employee, this.checkDeleteValidation);

        return super.init();
    }

    checkValidation(req) {

        const { NAME, EMAIL_ID } = req.data;

        // Empty validation
        if (!NAME || !EMAIL_ID) {
            req.error(400, 'Name and Email Id cannot be empty!');
        }

        // Email format validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (EMAIL_ID && !emailRegex.test(EMAIL_ID)) {
            req.error(400, 'Invalid Email Format!');
        }
    }

    checkDeleteValidation(req) {

        const { DEPARTMENT } = req.data;

        if (!DEPARTMENT) {
            req.error(400, 'Department empty!');
        }
    }
}

module.exports = { EmployeeService };