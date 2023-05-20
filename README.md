# Hackathon App

# Arquitetura

## **Assets**
Guarda os ativos usadas tanto na documentação, e no aplicativo
 * ## **Fonts**
    Armazena os estilos das fontes de texto.
 * ## **Images**
    Armazena as imagens.
 * ## **Animations**
    Armazena as animações, com extensão ".riv".
 * ## **Readme Files**
    Armazena as imagens usadas na documentação.

## **Shared**
Usada para arquivos compartilhados em todo o projeto.
 * ## **Utils**
    Armazena as constantes e validações usadas em várias páginas.
 * ## **Widgets**
    Armazena os widgets compartilhados em vários widgets.

## **Database**
Organiza a conexão com o/os banco/os de dados usados.

## **Errors**
Contém as classes que representam tipos personalizados de erros.

## **Models**
Modelos usados no tratamento de dados no backend
 * ## **Abstract**
    Contém classes abstratas para os **models**

## **Presentation**
Organiza a apresentação da aplicação, as páginas dentro de **Pages** lidando com a interface do usuário, a interação com o usuário a exibição dos dados e a rota de telas da aplicação, em **Routes**.
 * ## **Pages**
    Contém as páginas de todo o aplicativo
      * ## **Authentication**
         Páginas de login e cadastro
      * ## **HomePage**
         Primeira página do aplicativo e seus respectivos componentes
      * ## **Notes**
         Página das anotações do usuário e seus respectivos componentes

 * ## **Themes**
    Armazena os temas.

# Funcionamento

## Animação de entrada:

<p align="center">
  <img src="Assets/Readme Files/introduction.gif">
</p>

Em seguida encontramos nossa tela principal(HomePage) onde encontramos informações sobre **Nossos Produtos** e **Quem Somos** ao clicar nos respectivos botões ou rolar a tela para baixo ou **Fazer uma Pesquisa** sobre nós, escolher seu **Idioma** de preferência para usar nossa aplicação e fazer seu cadastro e login.

## Página de Cadastro:

<p align="center">
  <img src="Assets/Readme Files/sign_up.gif">
</p>

### Seguem as imagens do email enviado pelo **Firebase**:

<div align="center">
   <img src="Assets/Readme Files/received_email.jpeg" width="49%">
   <img src="Assets/Readme Files/email_checked.jpeg" width="49%">
</div>

## Em seguida faremos nosso Login:

<p align="center">
  <img src="Assets/Readme Files/login.gif">
</p>

### E entraremos em nosso menu principal, MainMenu, e resumidamente vou apresentar o menu de **Relatório Geral** para mostrar todas as principais funcionalidades básicas de cada sub-página:

<p align="center">
  <img src="Assets/Readme Files/main_menu.gif">
</p>

# Repositórios, páginas web e vídeos utilizados:

1) [Repositório](https://github.com/PedroLuisDionisioFraga/Connection-Flutter-to-Firebase) com exemplo de conexão com o **Firebase**
2) Todas as bibliotecas usadas nessa aplicação foram todas retiradas do [site](https://pub.dev/) oficial das bibliotecas do **flutter**.
3) Imagens, gifs e rives foram retirados do [rive](https://rive.app/), [figma](https://www.figma.com/), [flat icon](https://www.flaticon.com/br/) e [lottie](https://lottiefiles.com/).
4) Os erros foram resolvidos usando, [StackOverflow](https://stackoverflow.com/).
5) A tabBar foi criada usando como refrência [esse](https://www.geeksforgeeks.org/tab-page-selector-widget-in-flutter/) site.