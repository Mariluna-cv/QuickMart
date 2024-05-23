document.addEventListener('DOMContentLoaded', function() {
    const productosContainer = document.getElementById('productoscontainer');

    const productos = [
        { nombre: 'Manzana', precio: 80, imagen: 'img/manzana.png', stock: 10 },
        { nombre: 'Lechuga', precio: 20, imagen: 'img/lechuga.png', stock: 10 },
        { nombre: 'Cereal', precio: 50, imagen: 'img/cereal.png', stock: 10 },
        { nombre: 'Banana', precio: 50, imagen: 'img/banana.png', stock: 10 },
        { nombre: 'Leche', precio: 50, imagen: 'img/leche.png', stock: 10 },
        { nombre: 'Tomate', precio: 50, imagen: 'img/tomate.png', stock: 10 }
    ];

    function mostrarProductos(productos, contenedor) { 
        productos.forEach(producto => {
            const productoDiv = document.createElement('div');
            productoDiv.className = 'producto';
            productoDiv.innerHTML = `
                <img src="${producto.imagen}" alt="${producto.nombre}">
                <h3>${producto.nombre}</h3>
                <p class="precio">$${producto.precio}</p>
                <p class="stock" id="${producto.nombre}-stock">Stock: ${producto.stock}</p>
                <button onclick="agregarAlCarrito('${producto.nombre}', ${producto.precio}, ${producto.stock})">Añadir al carrito</button>
            `;
            contenedor.appendChild(productoDiv); 
        });
    }

    mostrarProductos(productos, productosContainer);

    window.actualizarProductos = function(nuevosProductos) {
        productosContainer.innerHTML = ''; 
        mostrarProductos(nuevosProductos, productosContainer);
    };
});

function agregarAlCarrito(nombre, precio, stock) {
    if (stock > 0) {
        const producto = { nombre, precio };
        const carrito = JSON.parse(localStorage.getItem('carrito')) || [];
        carrito.push(producto);
        localStorage.setItem('carrito', JSON.stringify(carrito));
        stock--;
        actualizarStockEnProductos(nombre, stock); 
        actualizarStockEnListaProductos(nombre, stock); 
    } else {
        alert(`¡${nombre} está fuera de stock!`);
    }
}

function actualizarStockEnProductos(nombre, nuevoStock) {
    const stockElement = document.getElementById(`${nombre}-stock`);
    if (stockElement) {
        stockElement.textContent = `Stock: ${nuevoStock}`;
    }
}

function actualizarStockEnListaProductos(nombre, nuevoStock) {
    const producto = productos.find(prod => prod.nombre === nombre);
    if (producto) {
        producto.stock = nuevoStock;
        window.actualizarProductos(productos);
    }
}
