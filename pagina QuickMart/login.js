document.addEventListener('DOMContentLoaded', function() {
  const loginForm = document.getElementById('login-form');
  const messageElement = document.getElementById('message');

  loginForm.addEventListener('submit', function(event) {
    event.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    if (username !== 'usuario1' && username !== 'administrador') {
      messageElement.textContent = 'Usuario inválido';
    } else if ((username === 'usuario1' && password !== '1234') || (username === 'administrador' && password !== 'admin123')) {
      messageElement.textContent = 'Contraseña incorrecta';
    } else {      
      messageElement.textContent = 'usuario correcto..Ingresando';
      message
      loginForm.reset(); 
      window.location.href = 'base.html';  
    }
  }); 

  document.getElementById('username').addEventListener('input', function() {
    messageElement.textContent = ''; 
  });
});
