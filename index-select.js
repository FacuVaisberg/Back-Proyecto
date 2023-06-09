import config from "./dbconfig.js";
import sql from 'mssql';
import Medicamentos from "./models/Medicamentos";
import PharmaService from "./services/pharmalife-service";
import Medicamentos from "./models/Medicamentos.js";
await testGetAll();
await testInsert();
await testUpdate();
await testDelete();
await testGetById();

async function testGetById(){
    let svc = new PharmaService();
    let remedio = await svc.getByID(1);

    console.log(remedio)
}

async function testGetAll(){
    let svc = new PharmaService();
    let remedio = await svc.getAll();

    console.log(remedio)
}

async function testInsert(){
    let svc = new PharmaService();
    let newremedio = new Medicamentos(3,"rekm","dehbd","messi");
    let remedio  = await svc.insert(newremedio)
    console.log(remedio)
}
async function testUpdate(){
    let svc = new PharmaService();
    let newremedio = new Medicamentos(2,"poshe","matute","pato")
    let remedio  = await svc.update(newremedio)
    console.log(remedio)
}
async function testDelete(){
    let svc = new PharmaService();
    let remedio  = await svc.deleteById(2)
    console.log(remedio)
}

// let pool = await sql.connect(config);
// let result = await pool.request().query("SELECT top 2 * from Pizzas");

// console.log(result.recordsets.length)
// console.log(result.recordsets[0].length)
// console.log(result.recordsets[0])
// console.log(result.recordsets)
// console.log(result.returnValue)
// console.log(result.output)
// console.log(result.rowsAffected)

// process.exit();