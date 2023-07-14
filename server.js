import express from "express";
import cors from "cors"
import MedicamentosRouter from "./ControllerMedicamento.js";
import RecetasRouter from "./ControllerReceta.js";
import UsuarioRouter from "./ControllerUsuario.js";
import authRouter from "./authController.js";
import getSignedToken from "./authController.js";
import passport from 'passport';
import { jwtStrategy } from './common/jwt.strategy.js';
import { Authenticate } from "./common/jwt.strategy.js";

const app  = express(); 
const port = 3000; 
app.use(cors());
app.use(express.json());
passport.use(jwtStrategy);
app.use(passport.initialize());

app.use("/api/auth/",authRouter);


app.post('/login' ,async (req,res) => {
    const token = getSignedToken();
    return res.status(200).json(token);
})


app.use("/api/medicamento/",MedicamentosRouter);
app.use("/api/receta/",RecetasRouter);
app.use("/api/usuario/",UsuarioRouter);


app.use(express.static('public'));

app.listen(port,()=>{
    console.log('listening on port');
})

