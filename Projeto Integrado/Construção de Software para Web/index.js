function abrirLink(event) {
    event.preventDefault(); // Impede o comportamento padrão de abrir uma nova guia

    // Obtém o URL do link
    var url = event.target.getAttribute('href');

    // Redireciona para o URL na mesma página
    window.location.href = url;
 }

function selecionarIdioma() {
    var select = document.getElementById("select-idioma");
    var idiomaSelecionado = select.value;
    console.log("Idioma selecionado: " + idiomaSelecionado);
    // Aqui você pode adicionar o código para realizar a ação desejada ao selecionar o idioma
}
  