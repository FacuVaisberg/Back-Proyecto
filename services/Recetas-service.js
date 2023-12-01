import config from "../dbconfig.js";
import sql from 'mssql';


export default class RecetaService
    {

        getById = async (id)=> {
            let returnEntity = null;
            console.log('Estoy en: RecetaService.getById');
            try {
                console.log(id);
                let pool = await sql.connect(config);
                let result = await pool.request()
                .input('pId' , sql.Int, id)
                .query(`SELECT * FROM Receta WHERE IdReceta = @pId`)
                returnEntity = result.recordsets[0][0];
            } catch (error) {
                console.log(error)
            }
            return returnEntity;
        }

    getAllDisponibles = async (id)=> {
            let returnEntity = null;
            console.log('Estoy en: RecetaService.GetAll');
            try {
                let pool = await sql.connect(config);
                let result = await pool.request()
                .query('select * from Receta where IdReceta not in (select IdReceta from Solicitudes)');
                result = await pool.request()
                .query('SELECT M.NombreMedicamento, UM.Nombre as NombreMedico, UP.Nombre as NombrePaciente, FechaCreacion, P.Direccion, P.Dni, U.Telefono , R.IdReceta FROM Receta R INNER JOIN Medicamentos M ON R.IdMedicamento = M.IdMedicamentos INNER JOIN Usuario UM ON R.IdMedico = UM.IdUsuario INNER JOIN Usuario UP ON R.IdPaciente = UP.IdUsuario INNER JOIN Paciente P ON P.IdUsuario = UP.IdUsuario INNER JOIN Usuario U  ON U.IdUsuario = UP.IdUsuario')
                returnEntity = result.recordsets[0];
                console.log(returnEntity)
            } catch (error) {
                console.log(error)
            }
            return returnEntity;
        }
    insert = async (receta) => {
        let rowsAffected = null;
        console.log('Estoy en: RecetaService.insert(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pIdMedicamento' , sql.Int, receta.IdMedicamento)
            .input('pIdMedico' , sql.Int, receta.IdMedico)
            .input('pIdPaciente' , sql.Int, receta.IdPaciente)
            .input('pIdFarmacia' , sql.Int, receta.IdFarmacia)
            .input('pFechaCreacion' , sql.Date, receta.FechaCreacion)
            .input('pFechaVencimiento' , sql.Date, receta.Fechavencimiento)
            .input('pEstado' , sql.Bit, receta.Estado)
            .input('pObservaciones' , sql.VarChar, receta.Observaciones)

            .query('insert into Receta(IdMedicamento, IdMedico, IdPaciente, IdFarmacia, FechaCreacion, FechaVencimiento, Estado, Observaciones) VALUES (@pIdMedicamento, @pIdMedico, @pIdPaciente, @pIdFarmacia, @pFechaCreacion, @pFechaVencimiento, @pEstado, @pObservaciones)');
        
            rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error); 
        }
        return rowsAffected;
    }

    update = async (receta, id) => {
        let rowsAffected = null;
        console.log('Estoy en: RecetaService.update(receta)');
        console.log(receta);
        console.log(id);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pIdReceta' , sql.Int, id)
            .input('pIdMedicamento' , sql.Int, receta.IdMedicamento)
            .input('pIdMedico' , sql.Int, receta.IdMedico)
            .input('pIdPaciente' , sql.Int, receta.IdPaciente)
            .input('pIdFarmacia' , sql.Int, receta.IdFarmacia)
            .input('pFechaCreacion' , sql.Date, receta.FechaCreacion)
            .input('pFechaVencimiento' , sql.Date, receta.Fechavencimiento)
            .input('pEstado' , sql.Bit, receta.Estado)
            .input('pObservaciones' , sql.Text, receta.Observaciones)

            .query('UPDATE Receta SET IdMedicamento=@pIdMedicamento, IdMedico=@pIdMedico, IdPaciente=@pIdPaciente, IdFarmacia=@pIdFarmacia, FechaCreacion=@pFechaCreacion, Fechavencimiento=@pFechaVencimiento, Estado=@pEstado, Observaciones=@pObservaciones WHERE IdReceta=@pIdReceta');
                
        rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }


    deleteById = async (id) => {
        let rowsAffected = 0;
        console.log(id);
        console.log('Estoy en: RecetaService.deleteById(id)',);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pIdReceta', sql.Int, id)
                                .query('DELETE FROM Receta WHERE IdReceta = @pIdReceta');
            rowsAffected = result.rowsAffected;    
            console.log('Delete OK');
        } catch (error) {
            console.log('Delete ERROR');
            console.log(error);
        }
        return rowsAffected;
    }

    getUltimo = async ()=> {
        let returnEntity = null;
        console.log('Estoy en: RecetaService.GetAll');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .query('SElect top 1 IdReceta FROM Receta order by IdReceta desc');
            returnEntity = result.recordsets[0][0];
            console.log(returnEntity)
        } catch (error) {
            console.log(error)
        }
        return returnEntity;
    }

}