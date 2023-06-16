import config from "../dbconfig.js";
import sql from 'mssql';


export default class PharmaService 
    {
        getAll = async ()=> {
            let returnEntity = null;
            console.log('Estoy en: PharmaService.GetAll');
            try {
                let pool = await sql.connect(config);
                let result = await pool.request()
                .query('select * from Receta');
                returnEntity = result.recordsets[0];
            } catch (error) {
                console.log(error)
            }
            return returnEntity;
        }
    insert = async (receta) => {
        let rowsAffected = null;
        console.log('Estoy en: PharmaciaService.insert(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pIdReceta' , sql.Int, receta.IdReceta)
            .input('pIdMedicamento' , sql.Int, receta.IdMedicamento)
            .input('pIdMedico' , sql.Int, receta.IdMedico)
            .input('IdPaciente' , sql.Int, receta.IdPaciente)
            .input('pIdFarmacia' , sql.Int, receta.IdFarmacia)
            .input('pFechaCreacion' , sql.Date, receta.FechaCreacion)
            .input('pFechaVencimiento' , sql.Date, receta.Fechavencimiento)
            .input('pEstado' , sql.Bit, receta.Estado)
            .input('pObservaciones' , sql.Text, receta.Observaciones)



                                .query('insert into Receta( IdReceta, IdMedicamento, IdMedico, IdPaciente, IdFarmacia, FechaCreacion, FechaVencimiento, Estado, Observaciones) VALUES (@pIdReceta, @pIdMedicamento, @pIdMedico, @pIdPaciente, @pIdFarmacia, @pFechaCreacion, @pFechaVencimiento, @pEstado, @pObservaciones)');
        rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error); 
        }
        return rowsAffected;
    }

    update = async (remedio, id) => {
        let rowsAffected = null;
        console.log('Estoy en: PharmaService.update(remedio)');
        console.log(remedio);
        console.log(id);
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pIdMedicamentos' , sql.Int, remedio.IdMedicamentos)
            .input('pNombreMedicamentos' , sql.Text, remedio.NombreMedicamento)

                                .query('insert into Medicamentos( IdMedicamentos, NombreMedicamento) VALUES ( @pIdMedicamentos, @pNombreMedicamento)');
                
        rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }


    deleteById = async (id) => {
        let rowsAffected = 0;
        console.log('Estoy en: PharmaService.deleteById(id)');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pIdMedicamentos', sql.Int, id)
                                .query('DELETE FROM Medicamentos WHERE id = @pIdMedicamentos');
        rowsAffected = result.rowsAffected;    
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }
}