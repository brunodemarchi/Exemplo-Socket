# Exemplo-Socket
Um exemplo de como se conectar com um socket para atualizar um mapa


# Como usar

- Entre na pasta e inicialize o projeto phoenix. Rodar "mix phx.server" e seguir os passos no console.
- Após iniciar o server, entrar no example_1.html e ver o mapa atualizando com os dados enviados pelo servidor.

# Como funciona

O servidor manda eventos a cada 4-10 segundos com uma lista de até pedidos, junto com as coordenadas X e Y. A cada mensagem nova do socket, nós pegamos esse payload de pedidos e atualizamos nosso mapa (feito com canvas)
