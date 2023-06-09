import express from "express";
import cors from "cors";
import PharmaService from "./services/pharmalife-service.js";
const app  = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static('public'));

app.get('/api/PharmaLife/', async (req, res) => {
    let svc = new PharmaService();
    let remedio = await svc.getAll();
    res.send(remedio);
})

app.delete('/api/PharmaLife/:id', async (req, res) => {
    let svc = new PharmaService();
    let remedio = await svc.deleteById(req.params.id);
    res.send(remedio);



})

app.put('/api/PharmaLife/:id', async(req, res) => {
    let cuerpo = req.body;
    console.log('estoy en Update');
    try{
        let svc = new PharmaService();
        let remedio  = await svc.update(cuerpo, req.params.id);
        res.send(remedio);
    } catch(error){
        console.log(error);
        res.send("error");

    }
})

app.post('/api/PharmaLife/', async(req, res) => {
    let  cuerpo = req.body;
    console.log(cuerpo);
    try{
        let svc = new PharmaService();
    let remedio  = await svc.insert(cuerpo);
    res.send(remedio);}
    catch(error)
    {
        res.send("error");

    }
})

app.listen(port,()=>{
    console.log('listening on port');
})

