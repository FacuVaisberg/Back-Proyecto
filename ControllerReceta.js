import { Router } from "express";
import { Authenticate } from "./common/jwt.strategy.js";
import Receta from "./services/Recetas-service.js";
import RecetaService from "./services/Recetas-service.js";
import SolicitudService from "./services/Solicitudes-service.js";

const router = Router();
const svc = new RecetaService();
const svcSolicitud = new SolicitudService();
router.get('/',async (req, res) => {
    
    let receta = await svc.getAllDisponibles();
    res.send(receta);
    console.log("estoy en el get de receta")
})

router.delete('/:id', Authenticate, async (req, res) => {

    let receta = await svc.deleteById(req.params.id);
    res.send(receta);
    console.log("delete")


})


router.put('/:id', Authenticate, async(req, res) => {
    let cuerpo = req.body;
    console.log('estoy en Update');
    try{
        let receta  = await svc.update(cuerpo, req.params.id);
        res.send(receta);
    } catch(error){
        console.log(error);
        res.send("error");

    }
})

router.post('/', async(req, res) => {
    let  cuerpo = req.body;
    console.log(cuerpo);
    try{
    let receta  = await svc.insert(cuerpo);

    let ultimo   = await svc.getUltimo();


    let  cuerpoSolicitud = {
        IdRemedio : cuerpo.IdMedicamento,
        IdPaciente: cuerpo.IdPaciente, 
        IdFarmacia: cuerpo.IdFarmacia,
        IdReceta: ultimo,
    }

    let soli  = await svcSolicitud.insert(cuerpoSolicitud)



    res.send(receta);}
    catch(error)
    {
        res.send("error");

    }
})

export default router;