# GI Update Tool

Este repositório contém um **script PowerShell** responsável por **localizar, copiar e extrair automaticamente** a versão mais recente do arquivo de atualização `GI_SQL_*` a partir de um diretório de rede para o diretório local do sistema GI.

O objetivo é **padronizar e simplificar o processo de atualização**, evitando erros manuais.

---

## 📌 O que o script faz

O script executa as seguintes etapas, em ordem:

1. Acessa um **diretório de rede**
2. Procura arquivos que sigam o padrão de nome:

```
GI_SQL_*
```


3. Caso existam vários arquivos, seleciona **o mais recente**, com base na **data de modificação**
4. Copia esse arquivo para o diretório local do GI
5. Extrai o conteúdo do arquivo `.zip`
6. Substitui automaticamente os arquivos existentes (sem perguntar)

---

## 📂 Estrutura de diretórios utilizada

### Diretório de rede (origem)
```
Q:\GI_ATUALIZACAO
```
> ⚠️ O drive `Q:` deve estar **mapeado** e acessível no momento da execução.


### Diretório local (destino)
```
C:\Program Files (x86)\GI2000
```


> Esse diretório **já deve existir** em todos os computadores.

---

## 🔐 Permissões importantes

- O diretório `C:\Program Files (x86)` é protegido pelo Windows
- O script **precisa ser executado como Administrador**
- Mesmo que o usuário tenha permissão NTFS, sem elevação o Windows bloqueará a escrita

---

## ▶️ Como executar corretamente

### Opção recomendada (mais estável)

Executar o script **através do arquivo `.bat`**, garantindo que o terminal não feche automaticamente.

## Contribuidores
- Eduardo Luís de Andrade Santos
- Fabiano Eduardo Tagliapietra