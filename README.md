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
# Hive para Persistência de Dados

Neste projeto, utilizamos o Hive como uma solução de banco de dados NoSQL para persistir os dados do jogo de Sudoku. Hive é uma biblioteca leve e eficiente que oferece uma maneira simples e rápida de armazenar e recuperar dados de forma local em dispositivos móveis e web.

### Por que Hive?

Optamos por usar o Hive por várias razões:

1. **Performance**: Hive é extremamente rápido, especialmente para operações de leitura e gravação de dados. Isso é crucial para garantir uma experiência de jogo suave e responsiva para os usuários.

2. **Simplicidade**: Hive é fácil de usar e requer pouca configuração. Sua sintaxe simples e intuitiva torna a persistência de dados uma tarefa simples e direta.

3. **Compatibilidade**: Hive é totalmente compatível com o Flutter e oferece suporte para plataformas móveis (Android e iOS) e web. Isso nos permite desenvolver uma solução de persistência de dados que funciona em uma variedade de dispositivos e ambientes.

### Integração com Repositórios e Casos de Uso

Neste projeto, utilizamos a arquitetura de repositórios e casos de uso para acessar e manipular os dados do Hive de forma organizada e modular. Aqui está como isso é feito:

- **Repositórios**: As classe `PlayerRepository` implementa a interface `IPlayerRepository` para encapsular a lógica de acesso aos dados do Hive. Isso permite que os casos de uso interajam com os dados de forma independente da implementação específica do banco de dados.

- **Casos de Uso**: Os casos de uso, como `LoadPlayerDataUseCase` e `SavePlayerDataUseCase`, são responsáveis por orquestrar as operações relacionadas aos dados do jogador. Eles chamam os métodos apropriados nos repositórios para carregar e salvar os dados, garantindo uma separação clara das responsabilidades e uma maior reutilização de código.

### Exemplo de Uso

Aqui está um exemplo simples de como podemos interagir com o Hive por meio dos repositórios e casos de uso:

```dart
// Carregando dados do jogador
final playerID = '123';
final playerData = await LoadPlayerDataUseCase(playerRepository).call(playerID);

// Salvando dados do jogador
final updatedPlayerData = playerData.copyWith(name: 'Novo Nome');
await SavePlayerDataUseCase(playerRepository).call(updatedPlayerData);
```
### Testes e Validações

Antes de implementar o Hive em nosso projeto, realizamos testes extensivos para garantir sua funcionalidade e confiabilidade. Além disso, validamos nossa implementação por meio de testes unitários e testes de integração para garantir que os dados sejam salvos e recuperados corretamente.

-----------------------------------------------------------------------------------------------------------------

# Testes Da Aplicação

Este projeto inclui um conjunto abrangente de testes para garantir que todas as funcionalidades estejam funcionando conforme o esperado. Os testes são organizados em diferentes categorias e podem ser encontrados no diretório `test`:

### Testes Unitários

Os testes unitários visam testar unidades individuais de código, como funções e métodos, de forma isolada para garantir que cada parte do código funcione corretamente.

- `test/unit/engine/engine_test.dart`: Este arquivo contém os testes unitários para a classe `GameEngine`, que é responsável pela lógica do jogo Sudoku. Os testes garantem que a geração, configuração e resolução dos quebra-cabeças Sudoku funcionem corretamente.

### Testes de Integração

Os testes de integração verificam se os diferentes componentes do sistema funcionam corretamente juntos como um todo. Eles garantem que as interações entre os diferentes módulos e funcionalidades estejam funcionando conforme o esperado.

### Testes de Interface do Usuário (UI)

Os testes de interface do usuário são responsáveis por verificar se a interface do usuário do aplicativo funciona corretamente, incluindo a navegação entre telas, interações do usuário e renderização correta dos elementos visuais.

### Testes Conjuntivos

Os testes conjuntivos garantem que as diferentes partes do sistema se integrem sem problemas, verificando se os diferentes módulos e componentes se comunicam e cooperam corretamente entre si.
-----------------------------------------------------------------------------------------------------------------

# Organização das Pastas

- lib
    - src
        - core
            - game
                - engine
                    - entities
                        - coordinates.dart
                    - enums
                        - difficulty_level.dart
                    - extensions
                        - int_extensions.dart
                    - models
                        - grid.dart
                        - pontuation.dart
                        - sequence.dart
                    - pontuation
                        - pontuation_system.dart
                    - game_engine.dart
                    - game_solver.dart
                - exceptions
                    - game_exception.dart
                    - higher_case_exception.dart
                    - invalid_move_exception.dart
                    - invalid_number_exception.dart
                    - matrix_exception.dart
            - data
                - database
                    - hive_client.dart
                    - models
                        - player_data.dart
                        - game_data.dart
                - repositories
                    - player_repository.dart
                    - game_repository.dart
                - use_case
                    - save_player_data.dart
                    - load_player_data.dart
                    - save_game_data.dart
                    - load_game_data.dart
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
            - dashboard (game page)
                - controller
                    - dashboard_controller.dart
                - presentation
                    - widgets
                        - cell_widget.dart
                        - grid_widget.dart
                        - stop_watch_text_widget.dart
                        - subgrid.dart
                    - game_dashboard_view.dart
                - dashboard_module.dart
            - start_page
                - widgets
                    - select_difficulty_bottom_sheet.dart
                    - start_page_button_list.dart
                - presentations
                    - start_page_view.dart
                - start_page_module.dart
        - app_module.dart
    - main.dart
- test
    - conjuntive
    - integration
    - ui
    - unit
        - engine
            - engine_test.dart
        - ansi_color.dart
