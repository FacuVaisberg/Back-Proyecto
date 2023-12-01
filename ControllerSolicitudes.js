import { Router } from "express";
import { Authenticate } from "./common/jwt.strategy.js";
import SolicitudesService from "./services/Solicitudes-service.js";

const router = Router();



router.get('/', async (req, res) => {
    let svc = new SolicitudesService();
    let receta = await svc.getAll();
    res.send(receta);
    console.log("estoy en el get de solicitudes")
})

router.get('/aceptados',async (req, res) => {
    let svc = new SolicitudesService();
    let receta = await svc.getAllAceptados();
    res.send(receta);
    console.log("estoy en el get de getAllAceptados")
})
router.get('/rechazados',async (req, res) => {
    let svc = new SolicitudesService();
    let receta = await svc.getAllRechazados();
    res.send(receta);
    console.log("estoy en el get de getAllRechazados")
})

router.delete('/:id', async (req, res) => {
    let svc = new SolicitudesService();
    let receta = await svc.deleteById(req.params.id);
    res.send(receta);
    console.log("delete")
})

router.post('/', async(req, res) => {
    let svc = new SolicitudesService();
    let  cuerpo = req.body;
    console.log(cuerpo);
    try{
        let receta  = await svc.insert(cuerpo);
        res.send(receta);}
    catch(error)
    {
        res.send("error");

    }
})

router.put('/aceptada/:id' ,async (req, res) => {
        let id = req.params.id;
        let svc = new SolicitudesService();
        const value = await svc.aceptada(id)
        res.send(value);
    }  
)



export default router;