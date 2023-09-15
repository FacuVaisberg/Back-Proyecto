import express from "express";
import cors from "cors"
import MedicamentosRouter from "./ControllerMedicamento.js";
import RecetasRouter from "./ControllerReceta.js";
import UsuarioRouter from "./ControllerUsuario.js";
import SolicitudesRouter from "./ControllerSolicitudes.js";
import authRouter from "./authController.js";
import getSignedToken from "./authController.js";
import passport from 'passport';
import { jwtStrategy } from './common/jwt.strategy.js';
import { Authenticate } from "./common/jwt.strategy.js";
import UsuarioService from "./services/Usuario-service.js";
import getByEmailPassword from "./services/Usuario-service.js"

const app  = express(); 
const port = 3000; 
app.use(cors());
app.use(express.json());
passport.use(jwtStrategy);
app.use(passport.initialize());

app.use("/api/auth/",authRouter);


app.post('/login' ,async (req,res) => {
    let email = req.body.email;
    let pws = req.body.password;
    let svc = new UsuarioService();

        const usuario = await svc.getByEmailPassword(email,pws)
        if (usuario != null){
            const token = getSignedToken();
            return res.status(200).json(token);
        }
         else{
        res.status(401).send('Los datos no son validos'); 
    }
}    
)



app.use("/api/medicamento/",MedicamentosRouter);
app.use("/api/receta/",RecetasRouter);
app.use("/api/usuario/",UsuarioRouter);
app.use("/api/solicitud/",SolicitudesRouter);


app.use(express.static('public'));

app.listen(port,()=>{
    console.log('listening on port');
})

