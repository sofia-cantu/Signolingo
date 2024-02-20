const dbService = require('../config/db.js')
const bcrypt = require('bcrypt');

module.exports = {
    getAdmin: (id) => {
        sql = ` SELECT id, email, name, isSuperUser
                FROM admins 
                WHERE id = ${id}`

        return dbService.querypromise(sql);
    },
    getAllAdmins: () => {
        sql = "SELECT id, email, name, isSuperUser FROM admins"
        return dbService.querypromise(sql);
    },
    deleteAdmin: (id) => {
        sql = ` DELETE FROM admins
                WHERE id = ${id} 
                RETURNING *`
        return dbService.querypromise(sql);
    }, 
    addAdmin: async (body) => {
        const {email, name, password, issuperuser} = body;
        const hashedPassword = await bcrypt.hash(password, 10);
        const sql = `INSERT INTO admins(email, name, password, issuperuser)
                     VALUES('${email}', '${name}', '${hashedPassword}', '${issuperuser}') 
                     RETURNING *`;
        return dbService.querypromise(sql);
    },
}
