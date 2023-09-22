import config from "../dbconfig.js";
import sql from 'mssql';


export default class UsuarioService
    {

    getByEmailPassword = async (email, password)=> {
        let returnEntity = null;
        console.log('Estoy en: UsuarioService.getByEmailPassowrd');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pEmail' , sql.VarChar, email)
            .input('pPassword' , sql.VarChar, password)
            .query(`
                SELECT * 
                FROM Usuario 
                WHERE  Mail = @pEmail
                AND  Contraseña = @pPassword
            `)
            returnEntity = result.recordsets[0][0];
            } catch (error) {
            console.log(error)
        }
        return returnEntity;
    }

    getMedicoById = async (id)=> {
        let returnEntity = null;
        console.log('Estoy en: UsuarioService.getMedicoById');
        try {
            console.log(id);
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pIdUsuario' , sql.Int, id)
            .query(`SELECT * FROM Medico M INNER JOIN Usuario U  ON U.IdUsuario = M.IdUsuario WHERE  M.IdUsuario = @pIdUsuario`)
            returnEntity = result.recordsets[0][0];
            } catch (error) {
            console.log(error)
        }
        return returnEntity;
    }

    getAll = async ()=> {
            let returnEntity = null;
            console.log('Estoy en: UsuarioService.GetAll');
            try {
                let pool = await sql.connect(config);
                let result = await pool.request()
                .query('select * from Usuario');
                returnEntity = result.recordsets[0];
            } catch (error) {
                console.log(error)
            }
            return returnEntity;
        }
    insertFarmacia = async (usuario) => {
        let rowsAffected = null;
        console.log('Estoy en: UsuarioService.insert(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pApellido' , sql.Text, usuario.Apellido)
            .input('pTelefono' , sql.Int, usuario.Telefono)
            .input('pMail' , sql.Text, usuario.Mail)
            .input('pContraseña' , sql.Text, usuario.Contraseña)
            .input('pNombre' , sql.Text, usuario.Nombre)
            .query('insert into Usuario(Apellido, Telefono, Mail, Contraseña, Nombre) VALUES (@pApellido, @pTelefono, @pMail, @pContraseña, @pNombre)')

            result = await pool.request()
            .query('select max(IdUsuario) as UltimoId from Usuario');
            result = await pool.request()
            .input('pIdUsuario' , sql.Int, result.recordset[0].UltimoId)
            .input('pDueñoFarmacia' , sql.Text, usuario.DueñoFarmacia)
            .input('pDireccion' , sql.Text, usuario.Direccion)
            .query('insert into Farmacia(IdUsuario, DueñoFarmacia, Direccion) VALUES (@pIdUsuario, @pDueñoFarmacia, @pDireccion)');            
            rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error); 
        }
        return rowsAffected;
    }

    insertMedico = async (usuario) => {
        let rowsAffected = null;
        console.log('Estoy en: UsuarioService.insert(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pApellido' , sql.Text, usuario.Apellido)
            .input('pTelefono' , sql.Int, usuario.Telefono)
            .input('pMail' , sql.Text, usuario.Mail)
            .input('pContraseña' , sql.Text, usuario.Contraseña)
            .input('pNombre' , sql.Text, usuario.Nombre)
            .query('insert into Usuario(Apellido, Telefono, Mail, Contraseña, Nombre) VALUES (@pApellido, @pTelefono, @pMail, @pContraseña, @pNombre)')

            result = await pool.request()
            .query('select max(IdUsuario) as UltimoId from Usuario');
            console.log(result.recordset[0].UltimoId)
            result = await pool.request()
            .input('pIdUsuario' , sql.Int, result.recordset[0].UltimoId)
            .input('pMatricula' , sql.Int, usuario.Matricula)
            .input('pFirma' , sql.Image, usuario.Firma)
            .query('insert into Medico(IdUsuario, Matricula, Firma) VALUES (@pIdUsuario, @pMatricula, @pFirma)');            
            
            rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error); 
        }
        return rowsAffected;
    }

    insertPaciente = async (usuario) => {
        let rowsAffected = null;
        console.log('Estoy en: UsuarioService.insert(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pApellido' , sql.Text, usuario.apellido)
            .input('pTelefono' , sql.Int, usuario.Telefono)
            .input('pMail' , sql.Text, usuario.Mail)
            .input('pContraseña' , sql.Text, usuario.Contraseña)
            .input('pNombre' , sql.Text, usuario.Nombre)
            .query('insert into Usuario(Apellido, Telefono, Mail, Contraseña, Nombre) VALUES (@pApellido, @pTelefono, @pMail, @pContraseña, @pNombre)')

            result = await pool.request()
            .query('select max(IdUsuario) as UltimoId from Usuario');
            console.log()
            result = await pool.request()
            .input('pIdUsuario' , sql.Int,  result.recordset[0].UltimoId)
            .input('pDireccion' , sql.Text, usuario.Direccion)
            .input('pDni' , sql.Int, usuario.Dni)
            .query('insert into Paciente(IdUsuario, Direccion, Dni) VALUES (@pIdUsuario, @pDireccion, @pDni)');            
            rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error); 
        }
        return rowsAffected;
    }

    update = async (usuario, id) => {
        let rowsAffected = null;
        console.log('Estoy en: UsuarioService.update(usuario)');
        console.log(usuario);
        console.log(id);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pIdUsuario' , sql.Int, usuario.IdUsuario)
            .input('pApellido' , sql.Text, usuario.apellido)
            .input('pTelefono' , sql.Int, usuario.Telefono)
            .input('pMail' , sql.Text, usuario.Mail)
            .input('pContraseña' , sql.Text, usuario.Contraseña)
            .input('pNombre' , sql.Text, usuario.Nombre)

            .query('UPDATE Receta SET IdUsuario=@pIdUsuario, Apellido=@pApellido, Telefono=@pTelefono, Mail=@pMail, Contraseña=@pContraseña, Nombre=@pNombre WHERE IdReceta=@pIdReceta');
                
        rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }


    deleteFarmacia = async (id) => {
        let rowsAffected = 0;
        console.log(id);
        console.log('Estoy en: UsuarioService.deleteFarmacia(id)',);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pIdUsuario', sql.Int, id)
                                .query('DELETE FROM Farmacia WHERE IdUsuario = @pIdUsuario;DELETE FROM Usuario WHERE IdUsuario = @pIdUsuario')
            rowsAffected = result.rowsAffected;    
            console.log('Delete OK');
        } catch (error) {
            console.log('Delete ERROR');
            console.log(error);
        }
        return rowsAffected;
    }

    deletePaciente = async (id) => {
        let rowsAffected = 0;
        console.log(id);
        console.log('Estoy en: UsuarioService.deletePaciente(id)',);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pIdUsuario', sql.Int, id)
                                .query('DELETE FROM Paciente WHERE IdUsuario = @pIdUsuario; DELETE FROM Usuario WHERE IdUsuario = @pIdUsuario')
            rowsAffected = result.rowsAffected;    
            console.log('Delete OK');
        } catch (error) {
            console.log('Delete ERROR');
            console.log(error);
        }
        return rowsAffected;
    }

    deleteMedico = async (id) => {
        let rowsAffected = 0;
        console.log(id);
        console.log('Estoy en: UsuarioService.deleteMedico(id)',);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pIdUsuario', sql.Int, id)
                                .query('DELETE FROM Medico WHERE IdUsuario = @pIdUsuario; DELETE FROM Usuario WHERE IdUsuario = @pIdUsuario')
            rowsAffected = result.rowsAffected;    
            console.log('Delete OK');
        } catch (error) {
            console.log('Delete ERROR');
            console.log(error);
        }
        return rowsAffected;
    }
}