import { Router } from "express";
import UsuarioService from "./services/Usuario-service.js";
import { Authenticate } from "./common/jwt.strategy.js";

const router = Router();
router.get('/', async (req, res) => {
    let svc = new UsuarioService();
    let usuario = await svc.getAll();
    res.send(usuario);
    console.log("estoy en el get")
})

router.delete('/Farmacia/:id', Authenticate, async (req, res) => {
    let svc = new UsuarioService();
    console.log(req.params.id);
    let usuario = await svc.deleteFarmacia(req.params.id);
    res.send(usuario);
})

router.delete('/Medico/:id', Authenticate, async (req, res) => {
    let svc = new UsuarioService();
    console.log(req.params.id);
    let usuario = await svc.deleteMedico(req.params.id);
    res.send(usuario);
})

router.delete('/Paciente/:id', Authenticate, async (req, res) => {
    let svc = new UsuarioService();
    console.log(req.params.id);
    let usuario = await svc.deletePaciente(req.params.id);
    res.send(usuario);
})

router.put('/:id', Authenticate,  async(req, res) => {
    let cuerpo = req.body;
    console.log('estoy en Update');
    try{
        let svc = new UsuarioService();
        let usuario  = await svc.update(cuerpo, req.params.id);
        res.send(usuario);
    } catch(error){
        console.log(error);
        res.send("error");

    }
})

router.post('/Farmacia/', Authenticate, async(req, res) => {
    let  cuerpo = req.body;
    console.log(cuerpo);
    try{
        let svc = new UsuarioService();
    let usuario  = await svc.insertFarmacia(cuerpo);
    res.send(usuario);}
    catch(error)
    {
        res.send("error");
    }
})

router.post('/Medico/', Authenticate, async(req, res) => {
    let  cuerpo = req.body;
    console.log(cuerpo);
    try{
        let svc = new UsuarioService();
        console.log("despues de usuarioservice");
        let usuario  = await svc.insertMedico(cuerpo);
        res.send(usuario);
    }
    catch(error)
    {
        res.send("error");
    }
})

router.post('/Paciente/', Authenticate, async(req, res) => {
    let  cuerpo = req.body;
    console.log(cuerpo);
    try{
        let svc = new UsuarioService();
    let usuario  = await svc.insertPaciente(cuerpo);
    res.send(usuario);}
    catch(error)
    {
        res.send("error");
    }
})

export default router;

