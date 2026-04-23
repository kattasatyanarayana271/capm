const cds = require('@sap/cds');

class EmployeeService extends cds.ApplicationService{

    init(){

        const {Employee} = this.entities;
        this.before(['CREATE','UPDATE'],Employee,this.checkValidation);
        return super.init();
    }

    checkValidation(req){

        const{NAME,EMAIL_ID} = req.data;

        if(!NAME || !EMAIL_ID){
            req.error('Name and Email Id Can not be empty!');
        }
    }
}

module.exports = {EmployeeService}
