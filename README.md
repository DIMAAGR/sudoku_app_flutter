# Sobre o Sudoku
O Sudoku, tal como o conhecemos hoje, tem suas raízes no jogo "Number Place", criado por Howard Garns em 1979. Inicialmente, Garns publicou esse quebra-cabeça em uma revista de quebra-cabeças nos Estados Unidos. No entanto, o Sudoku só ganhou popularidade em escala global no início do século XXI.

O nome "Sudoku" é de origem japonesa e significa "números únicos". Em 1986, o jogo foi introduzido no Japão pela revista de quebra-cabeças "Nikoli". O Sudoku começou a atrair a atenção internacional em 2004, quando jornais britânicos e americanos começaram a publicar o jogo.

A simplicidade das regras e a necessidade de raciocínio lógico fizeram com que o Sudoku se tornasse um fenômeno mundial. O jogo também se beneficiou da tecnologia, sendo adaptado para computadores e dispositivos eletrônicos, permitindo que as pessoas jogassem e resolvessem os quebra-cabeças de maneira mais acessível.

Desde então, o Sudoku tem permanecido como um dos quebra-cabeças mais populares do mundo, desafiando pessoas de todas as idades a exercitar suas habilidades de lógica e raciocínio. Ele encontrou seu lugar em jornais, livros, aplicativos e competições, tornando-se um passatempo intemporal e universal.

-----------------------------------------------------------------------------------------------------------------

# Sobre a Arquitetura do Projeto

Este projeto segue os princípios fundamentais de arquitetura de software propostos por Robert C. Martin, também conhecido como Uncle Bob, em seu livro "Clean Architecture". No entanto, é importante ressaltar que a aplicação desses conceitos é flexível e adaptável às necessidades específicas deste projeto.

### Princípios da Arquitetura Limpa


O conceito central da arquitetura limpa é a separação de preocupações e a manutenção da independência de camadas. Uncle Bob fornece uma estrutura geral como exemplo, mas reconhece a importância de adaptar a arquitetura de acordo com as particularidades de cada projeto.

### Personalização da Arquitetura

Cada projeto tem suas próprias nuances e requisitos únicos. Portanto, a arquitetura deste projeto foi personalizada para atender às suas necessidades específicas. A flexibilidade é um dos pilares aqui, permitindo ajustes e otimizações conforme necessário.

### Mantendo a Limpeza e Flexibilidade

O objetivo principal é manter o código limpo e flexível, facilitando a manutenção e evolução do projeto ao longo do tempo. A estrutura de pastas e a organização do código foram projetadas com esse propósito em mente. No entanto, encorajamos os colaboradores a sugerir melhorias e ajustes, garantindo que a arquitetura permaneça eficaz e adaptada às demandas em constante mudança.

### Contribuições e Discussões

Aceitamos contribuições e estamos abertos a discussões sobre a arquitetura do projeto. Se você tiver sugestões ou insights valiosos, sinta-se à vontade para compartilhar. Juntos, podemos manter o código limpo, flexível e adequado às necessidades específicas desta aplicação.

-----------------------------------------------------------------------------------------------------------------

# Funcionamento da Engine do Jogo

A classe `GameEngine` é o coração do jogo, responsável por gerar, configurar e resolver os quebra-cabeças Sudoku. Aqui está uma visão geral de como ela funciona:

- **Geração do Grid**: A função `generateGrid(Difficulty difficulty)` cria um novo quebra-cabeça Sudoku com base na dificuldade especificada. Ela preenche uma matriz 9x9 (_completedGameMatrix_) com números válidos e, em seguida, remove alguns números para criar o quebra-cabeça jogável (_playableGameMatrix_).

- **Definição de Números**: A função `setNumberOnGrid` permite que o jogador insira um número válido em uma célula vazia do quebra-cabeça jogável.

- **Verificação de Números**: A função `checkNumberOnGrid` verifica se um número inserido pelo jogador em uma célula do quebra-cabeça jogável corresponde ao número correto na mesma posição do quebra-cabeça completo.

### Como Utilizar a Engine do Jogo

Para utilizar a engine do jogo em seu projeto, siga estas etapas:

1. Importe o arquivo `game_engine.dart`.
2. Instancie a classe `GameEngine`.
3. Utilize os métodos `generateGrid`, `setNumberOnGrid`, e `checkNumberOnGrid` conforme necessário para gerar, jogar e verificar o quebra-cabeça Sudoku.

### Testes

Certifique-se de testar cada funcionalidade da engine do jogo para garantir seu funcionamento correto. Você pode criar testes unitários para as funções individuais e testes de integração para verificar o comportamento do jogo como um todo.

Com essa engine de jogo, você pode criar aplicativos, jogos ou até mesmo um site para jogar Sudoku e desafiar jogadores de todo o mundo a exercitar suas habilidades de lógica e raciocínio. Divirta-se criando e jogando Sudoku!

-----------------------------------------------------------------------------------------------------------------

# Organização das Pastas

- lib
    - src
        - core
            - engine
                - entities
                    - coordinates.dart
                - extensions
                    - int_extensions.dart
                - models
                    - grid.dart
                - exceptions
                    - game_exception.dart
                    - higher_case_exception.dart
                    - invalid_move_exception.dart
                    - invalid_number_exception.dart
                    - matrix_exception.dart
                - game_engine.dart
                - game_solver.dart
            - app
                - main_app.dart
            - const
                - const.dart
                - colors.dart
                - routes.dart
            - theme
                - app_theme.dart
                - dark.dart
                - light.dart
        - modules
            - start_page
                - presentations
                    - start_page_view.dart
                - start_page_module.dart
        - app_module.dart
    - main.dart