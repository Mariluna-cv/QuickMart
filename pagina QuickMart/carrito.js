document.addEventListener('DOMContentLoaded', function() {
    const totalElement = document.getElementById('total');
    const listaCarrito = document.getElementById('lista-carrito');

    function mostrarProductosCarrito() {
        let total = 0;
        listaCarrito.innerHTML = '';
        const carrito = JSON.parse(localStorage.getItem('carrito')) || [];
        carrito.forEach(producto => {
            const itemCarrito = document.createElement('li');
            itemCarrito.textContent = `${producto.nombre} - $${producto.precio}`;
            listaCarrito.appendChild(itemCarrito);
            total += producto.precio;
        });
        totalElement.textContent = total.toFixed(2);
    }


    mostrarProductosCarrito();


    window.addEventListener('storage', function() {
        mostrarProductosCarrito();
    });
});


function vaciarCarrito() {
    localStorage.removeItem('carrito');
    location.reload();
}
