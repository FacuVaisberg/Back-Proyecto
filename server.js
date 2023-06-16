import express from "express";
import cors from "cors"
import MedicamentosRouter from "./ControllerMedicamento.js";
import RecetasRouter from "./ControllerReceta.js";

const app  = express(); 
const port = 3000; 
// Agrego los Middlewares 
app.use(cors());
app.use(express.json());
app.use("/api/medicamento/",MedicamentosRouter);
app.use("/api/receta/",RecetasRouter);

app.use(express.static('public'));

//localhost:3000

app.listen(port,()=>{
    console.log('listening on port');
})

