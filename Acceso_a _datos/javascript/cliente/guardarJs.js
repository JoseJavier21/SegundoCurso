let form = document.querySelector("form")

form.addEventListener("submit", (e)=>{
    e.preventDefault()

    let producto = document.getElementById("producto").value
    let precio = document.getElementById("precio").value

    const data = {
        nombreProducto: producto,
        precio: precio
    }

    fetch('http://localhost:8080/api/producto',{
        method: 'post',
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    }).then(function(res){

        if(res.ok){
            console.log('Producto guardado')
        }
        
    }).catch((err)=>{
        console.error(err)
    })

})