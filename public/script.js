function CargarDatos() {
  let inputId = document.querySelector("#idPizza");
  let url = "http://localhost:3000/PharmaLife/" + inputId.value
  let contenedor = document.querySelector("#contenedor");

  axios
      .get(url)
      .then((result) => {
          contenedor.innerHTML = ""
          contenedor.innerHTML += `<ul>
      <li>${result.data.IdMedicamentos}</li>
      <li>${result.data.NombreMedicamento}</li> 
      </ul>    `
      })
      .catch((error) => {
          console.log(error);
      });
}

function CargarTodo() {
  axios
      .get("http://localhost:3000/api/PharmaLife")
      .then((result) => {
          console.log(result.data)
          let arr = result.data
          let contenedor = document.querySelector("#listado");
          contenedor.innerHTML = ""
          
          arr.map((item) => {
              contenedor.innerHTML += `
              <div class="col-4">
                    <div class="colorCard card border-success mb-3 cardPokemon" style="max-width: 20rem;">
                      <div class="card-header bg-colorCard headCard  ">${item.IdMedicamentos}.  ${item.NombreMedicamento} </div>
                       <div class="card-body text-success card-group">
                  </div>
                  <div class="card-footer bg-transparent border-success"> 
                  <button class="btn boton" onclick="Borrar(${item.IdMedicamentos})">Eliminar Pizzeta</button>
                  </div>
                        </div>
                        
                      </div>
                    </div>
                </div>
          
            `
          })
      })
      .catch((error) => {
          console.log(error);
      });
}
function Insert() {
  let nombre = document.getElementById("nombre").value;
  let cuerpo = {
    "Nombre": nombre
  }
  console.log(cuerpo);
  console.log("http://localhost:3000/api/PharmaLife", cuerpo)
  axios
      .post("http://localhost:3000/api/PharmaLife/", cuerpo)
      .then((result) => {
          console.log("OK");
          console.log(result.data)
          CargarTodo()
          
      })
      .catch((error) => {
          console.log(error);
      });
}

function Update() {
  let id = document.getElementById("id").value;
  let nombre = document.getElementById("nombre").value;

  const cuerpo = {
    id: id,
    nombre: nombre
  }
  console.log(cuerpo);
  var url='http://localhost:3000/api/PharmaLife/'+id
  
  axios
      .put(url,cuerpo)
      .then((result) => {
          console.log("OK");
          console.log(result.data)
          console.log(cuerpo)
          CargarTodo()
          listado.innerHTML += `se actualizó el medicamento numero: ${id} `
          
          
      })
      .catch((error) => {
          console.log(error);
      });
}

function Borrar(id) {
  let nombre = document.getElementById("nombre")
  //let id = document.getElementById("id")
  console.log("http://localhost:3000/api/PharmaLife/" + id)
  axios
      .delete("http://localhost:3000/api/PharmaLife/" + id)
      .then((result) => {
          console.log(result.data)
          CargarTodo()
          
      })
      .catch((error) => {
          console.log(error);
      });
}