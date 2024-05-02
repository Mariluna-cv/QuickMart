
function agregarAlCarrito(nombre, precio) {
    var producto = {
        nombre: nombre,
        precio: precio
    };
    var carrito = JSON.parse(localStorage.getItem('carrito')) || [];

    carrito.push(producto);

    localStorage.setItem('carrito', JSON.stringify(carrito));
}