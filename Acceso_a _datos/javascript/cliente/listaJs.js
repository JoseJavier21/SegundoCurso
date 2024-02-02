let dataBody = document.getElementById('data')
let tabla = document.querySelector('table')

tabla.addEventListener('click', (e)=>{
    let elemento = e.target

    let id = elemento.getAttribute('idDelete')

    console.log(id)

    eliminar(id)
})



function listar() {

    dataBody.innerHTML = ''
    
fetch('http://localhost:8080/api/productos').then((res)=>{

    return res.json()

}).then((data)=>{
    
    for(let i of data){
        dataBody.innerHTML += `
            <tr>
                <td>${i.nombreProducto}</td>
                <td>${i.precio}</td>
                <td>
                    <button idDelete="${i.id}">Eliminar</button>
                </td>
            </tr>
        `
    }

})

}

function eliminar(id){
    fetch('http://localhost:8080/api/producto/' + id,{
        method: 'DELETE',
    }).then((e)=>{
        if(e.ok){
            console.log('producto eliminado')
            listar()
        }
    })
}


// Llamadas a la funciones

listar()