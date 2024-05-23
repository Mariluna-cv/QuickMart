document.addEventListener('DOMContentLoaded', function() {
    const productosContainer = document.getElementById('productoscontainer');

    const productos = [
        { nombre: 'Manzana', precio: 80, stock: 10, imagen: 'img/manzana.png' },
        { nombre: 'Lechuga', precio: 20, stock: 10, imagen: 'img/lechuga.png' },
        { nombre: 'Cereal', precio: 50, stock: 10, imagen: 'img/cereal.png' },
        { nombre: 'Banana', precio: 50, stock: 10, imagen: 'img/banana.png' },
        { nombre: 'Leche', precio: 50, stock: 10, imagen: 'img/leche.png' },
        { nombre: 'Tomate', precio: 50, stock: 10, imagen: 'img/tomate.png' }
    ];

    function mostrarProductos(productos, contenedor) { 
        productos.forEach(producto => {
            const productoDiv = document.createElement('div');
            productoDiv.className = 'producto';
            productoDiv.innerHTML = `
                <img src="${producto.imagen}" alt="${producto.nombre}">
                <h3>${producto.nombre}</h3>
                <p class="precio">$${producto.precio}</p>
                <p class="stock">Stock: ${producto.stock}</p>
                <button onclick="eliminarProducto('${producto.nombre}')">Eliminar</button>
                <button onclick="actualizarStock('${producto.nombre}')">Actualizar Stock</button>
            `;
            contenedor.appendChild(productoDiv); 
        });
    }

    mostrarProductos(productos, productosContainer);

    window.eliminarProducto = function(nombreProducto) {
        const index = productos.findIndex(producto => producto.nombre === nombreProducto);
        if (index !== -1) {
            productos.splice(index, 1);
            actualizarProductosJS();
        }
    };

    window.actualizarStock = function(nombreProducto) {
        const nuevoStock = prompt(`Ingrese el nuevo stock para ${nombreProducto}:`);
        if (nuevoStock !== null && !isNaN(nuevoStock)) {
            const producto = productos.find(prod => prod.nombre === nombreProducto);
            if (producto) {
                producto.stock = parseInt(nuevoStock);
                actualizarProductosJS();
            }
        } else {
            alert('Ingrese un valor válido para el stock.');
        }
    };

    function actualizarProductosJS() {
        localStorage.setItem('productos', JSON.stringify(productos));
        alert('Productos actualizados.');
        productosContainer.innerHTML = '';
        mostrarProductos(productos, productosContainer);
        const actualizarProductosEvent = new Event('actualizarProductos');
        window.dispatchEvent(actualizarProductosEvent);
    }

});
