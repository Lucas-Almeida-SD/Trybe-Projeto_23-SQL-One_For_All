# Projeto - SQL - One For All

Esse projeto foi realizado para exercitar o que foi aprendido no Bloco 21 do Módulo de Back End do curso da [Trybe](https://www.betrybe.com/), no qual foi sobre `Funções SQL, JOINs e Normalização`.

Nesse projeto, foi realizado a `modelagem` e `normalização` de um banco de dados através de uma tabela contendo algumas informações.

Após a modelagem e normalização, foram desenvolvidas algumas `queries` para realizar buscas de acordo com os requisitos abaixo.

# Requisitos do projeto
## Desafio 1

* Crie um banco com o nome de **`SpotifyClone`**.

* Providencie as queries necessárias para criar tabelas normalizadas;

* Providencie as queries necessárias para popular as tabelas;

* Crie um arquivo de configurações `desafio1.json`, que mapeará em qual tabela e coluna se encontram as informações necessárias para a avaliação automatizada deste desafio. 

<details>
  <summary><strong>👇 As configurações devem possuir o seguinte formato</strong></summary><br />

  ```json
  {
    "coluna_usuario": "nome-da-coluna",
    "tabela_que_contem_usuario": "nome-da-tabela-que-armazena-a-coluna",
    "coluna_plano": "nome-da-coluna",
    "tabela_que_contem_plano": "nome-da-tabela-que-armazena-a-coluna",
    "coluna_historico_de_reproducoes": "nome-da-coluna",
    "tabela_que_contem_historico_de_reproducoes": "nome-da-tabela-que-armazena-a-coluna",
    "coluna_seguindo_artistas": "nome-da-coluna",
    "tabela_que_contem_seguindo_artistas": "nome-da-tabela-que-armazena-a-coluna",
    "coluna_artista": "nome-da-coluna",
    "tabela_que_contem_artista": "nome-da-tabela-que-armazena-a-coluna",
    "coluna_album": "nome-da-coluna",
    "tabela_que_contem_album": "nome-da-tabela-que-armazena-a-coluna",
    "coluna_cancoes": "nome-da-coluna",
    "tabela_que_contem_cancoes": "nome-da-tabela-que-armazena-a-coluna"
  }
  ```

  Essa configuração deve ser feita baseada no seu banco de dados **após a normalização**. Ou seja, se você criou uma tabela chamada `users` que possui a coluna `name`, você substituiria `"coluna_usuario"` e `"tabela_que_contem_usuario"` da seguinte forma:

  ```json
  {
    "coluna_usuario": "name",
    "tabela_que_contem_usuario": "users",
    ...
  }
  ```

</details>

* Salve as queries criadas no arquivo `desafio1.sql`.

<details>
<summary><strong>👇 Seu código deverá ser similar ao seguinte</strong></summary><br />

  ```sql
  DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE SpotifyClone;

  CREATE TABLE SpotifyClone.tabela1(
      coluna1 tipo restricoes,
      coluna2 tipo restricoes,
      colunaN tipo restricoes,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.tabela2(
      coluna1 tipo restricoes,
      coluna2 tipo restricoes,
      colunaN tipo restricoes,
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados A'),
    ('exemplo de dados 2', 'exemplo de dados B'),
    ('exemplo de dados 3', 'exemplo de dados C');

  INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados X'),
    ('exemplo de dados 2', 'exemplo de dados Y');
  ```

</details>

<details>
<summary><strong>☑️ O que será verificado</strong></summary><br />

  - Será validado se os planos estão na tabela normalizada.

  - Será validado se o histórico de reprodução está na tabela normalizada.

  - Será validado se as informações sobre pessoas seguindo artistas estão na tabela normalizada.

  - Será validado se os álbuns estão na tabela normalizada.

  - Será validado se as canções estão na tabela normalizada.

  - Será validado se as informações sobre pessoas usuárias estão na tabela normalizada.

  - Será validado se as informações sobre artistas estão na tabela normalizada.

  ⚠️ Note que uma vez executado um teste, a sua base de dados `SpotifyClone` **será dropada**. Logo, **se atente** a salvar seu progresso nos arquivos de desafio! ⚠️
 
</details>

## Desafio 2

Crie uma `QUERY` que exiba três colunas:

1. A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "**cancoes**".

2. A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "**artistas**".

3. A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "**albuns**".

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Estatísticas musicais](./images/estatisticas_musicais.png)

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `cancoes`, `artistas` e `albuns`.

</details>

## Desafio 3

Crie uma `QUERY` que deverá ter apenas três colunas:

1. A primeira coluna deve possuir o alias "**usuario**" e exibir o nome da pessoa usuária.

2. A segunda coluna deve possuir o alias "**qtde_musicas_ouvidas**" e exibir a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.

3. A terceira coluna deve possuir o alias "**total_minutos**" e exibir a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.

Os resultados devem estar agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Histórico de reprodução das pessoas usuárias](./images/HistoricoReproducaoUsuarios.png)

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `usuario`, `qtde_musicas_ouvidas` e `total_minutos`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

## Desafio 4

Crie uma `QUERY` que deve mostrar as pessoas usuárias que estavam ativas no ano de **2021** se baseando na data mais recente no histórico de reprodução.

1. A primeira coluna deve possuir o alias "**usuario**" e exibir o nome da pessoa usuária.

2. A segunda coluna deve ter o alias "**condicao_usuario**" e exibir se a pessoa usuária está ativa ou inativa.

O resultado deve estar ordenado em ordem alfabética.

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Condição da pessoa usuária](./images/condicao_usuario.png)

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `usuario` e `condicao_usuario`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

## Desafio 5

Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. Crie uma `QUERY` que possua duas colunas:

1. A primeira coluna deve possuir o alias "**cancao**" e exibir o nome da canção.

2. A segunda coluna deve possuir o alias "**reproducoes**" e exibir a quantidade de pessoas que já escutaram a canção em questão.

Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Top 2 hits do momento](./images/top_2_hits_do_momento.png)


O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `cancao` e `reproducoes`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

## Desafio 6

Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco, queremos algumas informações sobre o faturamento da empresa. Crie uma `QUERY` que deve exibir quatro dados:

1. A primeira coluna deve ter o alias "**faturamento_minimo**" e exibir o menor valor de plano existente para uma pessoa usuária.

2. A segunda coluna deve ter o alias "**faturamento_maximo**" e exibir o maior valor de plano existente para uma pessoa usuária.

3. A terceira coluna deve ter o alias "**faturamento_medio**" e exibir o valor médio dos planos possuídos por pessoas usuárias até o momento.

4. Por fim, a quarta coluna deve ter o alias "**faturamento_total**" e exibir o valor total obtido com os planos possuídos por pessoas usuárias.

Para cada um desses dados, por se tratarem de valores monetários, deve-se arredondar o faturamento usando apenas duas casas decimais.

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Faturamento atual](./images/faturamento_atual.png)

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `faturamento_minimo`, `faturamento_maximo`, `faturamento_medio` e `faturamento_total`.

</details>

## Desafio 7

Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, com a quantidade de seguidores que ela possui, de acordo com os detalhes a seguir. Para tal, crie uma `QUERY` com as seguintes colunas:

1. A primeira coluna deve exibir o nome da pessoa artista, com o alias "**artista**".

2. A segunda coluna deve exibir o nome do álbum, com o alias "**album**".

3. A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "**seguidores**".

Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras. Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso há artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![PerfilArtistas](./images/perfil_artistas.png)

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `artista`, `album` e `seguidores`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

## Desafio 8

Mostre uma relação dos álbuns produzidos por um artista específico, neste caso `"Walter Phoenix"`.
Para isto crie uma `QUERY` que o retorno deve exibir as seguintes colunas:

1. O nome da pessoa artista, com o alias "**artista**".

2. O nome do álbum, com o alias "**album**".

Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Álbuns da pessoa artista](./images/AlbunsDoArtista.png)

O que será verificado:

- Será validado se a `QUERY` retorna a coluna `artista` contendo o nome da pessoa artista e a coluna `album` contendo o nome do álbum.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

## Desafio 9

Crie uma `QUERY` que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica. Para este caso queremos saber quantas músicas estão no histórico do usuário `"Bill"` e a consulta deve retornar a seguinte coluna:

1. O valor da quantidade, com o alias "**quantidade_musicas_no_historico**".

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Quantidade de músicas no histórico](./images/quantidade_musicas_no_historico.png)


O que será verificado:

- Será validado se a `QUERY` retorna a quantidade correta de canções presentes no histórico de reprodução da pessoa especificada.

</details>

## Desafio 10

Crie uma `QUERY` que exiba o nome e a quantidade de vezes que cada canção foi tocada por pessoas usuárias do plano gratuito ou pessoal de acordo com os detalhes a seguir:

* A primeira coluna deve exibir o nome da canção, com o alias "**nome**";

* A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "**reproducoes**";

* Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` deve retornar a seguinte informação:

![Canções premium](./images/cancoes_premium.png)

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `nome` e `reproducoes`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

## BÔNUS

### Desafio 11

Crie uma `QUERY` que altere o nome de algumas músicas e as ordene em ordem alfabética com as colunas abaixo se baseando nos seguintes critérios:

1. O nome da música em seu estado normal com o alias **nome_musica**

2. O nome da música atualizado com o alias **novo_nome**

**Critérios**

- Trocar a palavra **"Streets"** no final do nome de uma música por **"Code Review"**

- Trocar a palavra **"Her Own"** no final do nome de uma música por **"Trybe"**

- Trocar a palavra **"Inner Fire"** no final do nome de uma música por **"Project"**

- Trocar a palavra **"Silly"** no final do nome de uma música por **"Nice"**

- Trocar a palavra **"Circus"** no final do nome de uma música por **"Pull Request"**

<details>
  <summary><strong>➕ Informações complementares</strong></summary><br />

Sua `QUERY` retornar a seguinte informação:

![Nome das músicas trocados](./images/replace_name.png)

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `nome_musica` e `novo_nome`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>


# Como executar

Clone o projeto e acesse a pasta do mesmo.

```bash
$ git clone git@github.com:Lucas-Almeida-SD/Trybe-Projeto_23-SQL-One_For_All.git
$ cd Trybe-Projeto_23-SQL-One_For_All
```

Abra o `MySQL Workbench` e restaure o banco de dados `SpotifyClone` que está no arquivo `desafio1.sql`.

Utilize as queries que estão nos arquivos `desafio{n}.sql` para realizar as buscas/manipulações.