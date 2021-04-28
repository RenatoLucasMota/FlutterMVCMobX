## Projeto voltado para demonstrar o uso do Padrão MVC com MobX

### Features
-  Uso de MobX
-  Consumo de Api com http
-  Estruturação de pastas 
-  Utilização de Repositórios e Interfaces (Contratos)
-  Utilização de Rotas nomeadas


#### main.dart

Criar rotas nomeadas, assim como fazemos em projetos web, onde na URL passamos a rota que queremos acessar, é algo benéfico em questão de injeção de dependências, em virtude de não ter necessidade de importar o arquivo referente àquela tela
São declaradas as rotas e informado quais delas é a rota inicial, de modo que quando abra o App, seja aberta a *HomeView:*

```dart
return MaterialApp(
    ...

    routes: {
        '/': (context) => HomeView(),
        '/comments': (context) => CommentsView(
            idPost: ModalRoute.of(context).settings.arguments,
        ),
    },
    initialRoute: '/',
);
```

Uma das formas de passar argumentos para uma rota nomeada é através do *ModalRoute:*

```dart
'/comments': (context) => CommentsView(
    idPost: ModalRoute.of(context).settings.arguments,
),
```


#### shared

Na pasta *shared* terão apenas os arquivos que vão ser compartilhados pelo app inteiro, como uma pasta commons
Neste exemplo de app criado, esta pasta conterá as URL da API que estaremos consumindo
Abribuímos essas URL a constantes do tipo *static*, pois dessa forma não precisamos criar a classe para acessar esses atributos: 

```dart
class ConstsApi {
    static const POST_URL = 'https://jsonplaceholder.typicode.com/posts';
    static const COMMENT_URL = 'https://jsonplaceholder.typicode.com/comments?postId=';
}
```


#### interfaces

Pesquisar por interfaces / contratos

Você pode criar uma interface com vários métodos que você quer que tenha em determinadas classes e essas classe vão ser obrigadas a implementar esses métodos
Ajuda na injeção de dependência, pois não é necessário dar import em vários métodos com a mesma estrutura de métodos


#### repositories

Onde se coloca o tratamento de APIs ou de DAO que vão ser utilizadas. Caso for fazer persistência de dados no Dao, será nesse repositório


##### post_repository.dart

Se implementa o PostRepository implementando o IPostRepository. O "I", de *I*PostRepository é uma convenção de modo a informar que é uma Interface


#### controllers

No arquivo controller que criamos (post_controller.dart) é instanciada a classe PostRepository criado em repositories / post_repository.dart

```dart
PostRepository _postRepository;
```

E passamos a instância no construtor da classe abstrata. Não usamos Provider e Get It neste caso para manipular os objetos, pois só precisamos dessa informação uma vez, não há necessidade de que o App todo visualize essa informação

```dart
PostRepository _postRepository;

_PostControllerBase() {
    _postRepository = PostRepository();
}
```

Para alimentar as listas conforme o consumo da API, são criados os seguintes observable

```dart
@observable
ObservableList<Post> listPost;

@observable
ObservableList<Comment> listComment;
```

E são criadas as seguintes

```dart
@action
loadPosts() async {
    listPost = ObservableList<Post>.of(await _postRepository.getAllPosts());
}

@action
loadComments({int idPost}) async {
    listComment = ObservableList<Comment>.of(await _postRepository.getComments(idPost));
}
```


#### view / home / home.dart

Importar o controller e instanciar. No initState chamamos o loadPosts() para carregar a lista

```dart
import 'package:mvc_example/controllers/post_controller.dart';

class _HomeViewState extends State<HomeView> {
    PostController _postController;

    @override
    void initState() {
        super.initState();
        _postController = PostController();
        _postController.loadPosts();
    }
}
```

No appbar cria-se um botão onde o usuário pode dar o refresh na lista que, quando clicado, carrega os posts da lista novamente

```dart
appBar: AppBar(
    actions: <Widget>[
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
                _postController.loadPosts();
            },
        )
    ],
    title: Text('MVC Example - Posts'),
),
```