
---

## 🧩 Sintaxe dos templates

Em qualquer asset (`/assets/*`) você pode usar:

| Sintaxe | O que faz |
|---|---|
| `<<$variavel>>` | substitui pela variável |
| `<<include(arquivo)>>` | inclui outro asset pelo nome |
| `<<sleep(N)>>` | pausa N segundos |
| `\x1b[...m` | escape ANSI (cor) — é convertido pra byte real |
| `\033[...m` | idem |
| `\e[...m` | idem |
| `\n`, `\r`, `\t`, `\a` | escapes de controle |

---

## 🎯 Variáveis de sessão

### Usuário
| Variável | Descrição |
|---|---|
| `<<$username>>` | username logado |
| `<<$roles>>` | roles (`admin`, `user`) |
| `<<$remoteaddress>>` | IP do cliente SSH |
| `<<$remoteclient>>` | cliente SSH (se disponível) |

### Limites
| Variável | Descrição |
|---|---|
| `<<$concurrents>>` | máximo de ataques simultâneos |
| `<<$timelimit>>` | tempo máximo por ataque |
| `<<$maxtime>>` | tempo máximo absoluto |
| `<<$cooldown>>` | cooldown entre ataques (s) |
| `<<$credits>>` | créditos disponíveis |

### Expiração
| Variável | Descrição |
|---|---|
| `<<$expiry>>` | tempo até expirar (`30 days`) |
| `<<$expirydate>>` | data de expiração (`2026-05-20`) |
| `<<$expirydays>>` | dias restantes (inteiro) |

### Flags
| Variável | Valores |
|---|---|
| `<<$vip>>` | `true` / `false` |
| `<<$reseller>>` | `true` / `false` |
| `<<$admin>>` | `true` / `false` |
| `<<$banned>>` | `true` / `false` |
| `<<$api>>` | `true` / `false` |

---

## 📊 Contadores

| Variável | Descrição |
|---|---|
| `<<$ongoing>>` | ataques ativos do usuário |
| `<<$onlineusers>>` | sessões abertas agora |
| `<<$allgoing>>` | ataques ativos globais |
| `<<$allattacks>>` | total histórico de ataques |
| `<<$totalusers>>` | total de usuários no DB |
| `<<$botcount>>` | bots conectados (inclui fake) |

---

## 📅 Estatísticas

| Variável | Descrição |
|---|---|
| `<<$attacks_30days>>` | ataques nos últimos 30 dias |
| `<<$attacks_7days>>` | ataques nos últimos 7 dias |
| `<<$attacks_today>>` | ataques hoje |

### Top 5
| Variável | Descrição |
|---|---|
| `<<$most_method1>>` … `<<$most_method5>>` | top 5 métodos |
| `<<$most_host1>>` … `<<$most_host5>>` | top 5 hosts |
| `<<$most_user1>>` … `<<$most_user5>>` | top 5 usuários |

---

## ⚔️ Ataque (dentro de `/assets/attack`)

Preenchidas ao disparar um ataque via `!method <host> <port> <time>`.

| Variável | Descrição |
|---|---|
| `<<$host>>` | host como digitado (pode ser domínio) |
| `<<$target_ip>>` | IP resolvido do host |
| `<<$port>>` | porta |
| `<<$time>>` | duração em segundos |
| `<<$method>>` | nome do método (`tls`, `udp`, …) |
| `<<$region>>` | região (GeoIP) |
| `<<$org>>` | organização (GeoIP) |
| `<<$country>>` | código do país (GeoIP) |
| `<<$delay>>` | delay configurado |

---

## 🔍 Lookup (dentro de `/assets/lookup`)

Preenchidas ao rodar `lookup <host>`.

| Variável | Descrição |
|---|---|
| `<<$lookup_host>>` | host digitado |
| `<<$lookup_ip>>` | IP resolvido |
| `<<$lookup_reverse>>` | PTR / reverse DNS |
| `<<$lookup_country>>` | país + código (`Canada (CA)`) |
| `<<$lookup_region>>` | estado / região |
| `<<$lookup_city>>` | cidade |
| `<<$lookup_zip>>` | CEP |
| `<<$lookup_org>>` | organização |
| `<<$lookup_isp>>` | ISP |
| `<<$lookup_asn>>` | ASN (`AS13335 Cloudflare, Inc.`) |
| `<<$lookup_lat>>` | latitude |
| `<<$lookup_lon>>` | longitude |
| `<<$lookup_timezone>>` | timezone (`America/Toronto`) |

---

## 🖥️ Sistema

| Variável | Descrição |
|---|---|
| `<<$uptime>>` | tempo desde o boot (`3d 4h 12m 5s`) |
| `<<$os>>` | sistema operacional (`linux`) |
| `<<$arch>>` | arquitetura (`x86`) |
| `<<$date>>` | data atual (`2026-10-16`) |
| `<<$timenow>>` | hora atual (`3:04pm`) |
| `<<$timezone>>` | timezone da sessão |

---

## 🎛️ Especiais

| Variável | Efeito |
|---|---|
| `<<$clear>>` | limpa a tela + scrollback (`\033[2J\033[H\033[3J`) |
| `<<$ring>>` | bell (`\a`) |
| `<<$spinner>>` | primeiro item do spinner (config) |

---

## 🧠 Variáveis do config (`belzebu.json`)

Usadas no prompt e title:

- `<<$username>>`, `<<$ongoing>>`, `<<$concurrents>>`
- `<<$allgoing>>`, `<<$expiry>>`, `<<$onlineusers>>`
- Qualquer variável da lista acima

Exemplo de `title`:
```json
"title": "Beyond C2 / User: <<$username>> / Ongoing: <<$ongoing>>/<<$concurrents>> / Global: <<$allgoing>>/25 / Expiry: <<$expiry>> / Online: <<$onlineusers>>"