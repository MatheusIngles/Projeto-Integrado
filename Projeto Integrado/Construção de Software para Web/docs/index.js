function abrirLink(event) {
    event.preventDefault(); // Impede o comportamento padrão de abrir uma nova guia

    // Obtém o URL do link
    var url = event.target.getAttribute('href');

    // Redireciona para o URL na mesma página
    window.location.href = url;
  }