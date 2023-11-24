import config from "../dbconfig.js";
import sql from 'mssql';


export default class SolicitudesService
    {
        getAll = async ()=> {
            let returnEntity = null;
            console.log('Estoy en: soli.Service.GetAll');
            try {
                let pool = await sql.connect(config);
                let result = await pool.request()
                .query('SELECT IdSolicitud, M.NombreMedicamento, M.IdMedicamentos as IdRemedio, UP.Nombre, UP.IdUsuario AS IdPaciente, UF.Nombre, UF.IdUsuario AS IdFarmacia FROM Solicitudes S INNER JOIN Medicamentos M ON S.IdRemedio = M.IdMedicamentos INNER JOIN Usuario UF ON S.IdFarmacia = UF.IdUsuario INNER JOIN Usuario UP ON S.IdPaciente = UP.IdUsuario');
                returnEntity = result.recordsets[0];
            } catch (error) {
                console.log(error)
            }
            return returnEntity;
        }
    insert = async (soli) => {
        let rowsAffected = null;
        console.log('Estoy en: Soli.Service.insert(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pIdRemedio' , sql.Int, soli.IdRemedio)
            .input('pIdPaciente' , sql.Int, soli.IdPaciente)
            .input('pIdFarmacia' , sql.Int, soli.IdFarmacia)
            .input('pIdReceta' , sql.Int, soli.IdReceta)
            .input('pPrecio' , sql.Int, soli.Precio)

            .query('insert into Solicitudes(IdRemedio, IdPaciente, IdFarmacia, IdReceta, Precio) VALUES (@pIdRemedio, @pIdPaciente, @pIdFarmacia, @pIdReceta, @pPrecio)');
        
            rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error); 
        }
        return rowsAffected;
    }

    deleteById = async (id) => {
        let rowsAffected = 0;
        console.log(id);
        console.log('Estoy en: soli.Service.deleteById(id)',);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pIdSolicitud', sql.Int, id)
                                .query('DELETE FROM Solicitudes WHERE IdSolicitud = @pIdSolicitud');
            rowsAffected = result.rowsAffected;    
            console.log('Delete OK');
        } catch (error) {
            console.log('Delete ERROR');
            console.log(error);
        }
        return rowsAffected;
    }

    aceptada = async (id) => {
        let rowsAffected = 0;
        console.log(id);
        console.log("estoy en soli.Service.aceptada");
        try{
            let pool = await sql.connect(config);
            let result = await pool.request()
                .input('pIdSolicitud', sql.Int, id.IdSolicitud)
                .input('pFecha', sql.Bit, Fecha)
                .query('Update Solicitudes set Fecha = 1 WHERE IdSolicitud = @pIdSolicitud')

                rowsAffected = result.rowsAffected;    
                console.log('Delete OK');
            } catch (error) {
                console.log('Delete ERROR');
                console.log(error);
            }
            return rowsAffected;
        }
    }