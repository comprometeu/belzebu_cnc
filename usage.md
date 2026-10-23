================================================================================
 BELZEBU CNC — TEMPLATE VARIABLES REFERENCE
================================================================================

SINTAXE
  <<$variavel>>              substitui pelo valor
  <<$variavel_left>>         alinha à esquerda em 15 caracteres
  <<$variavel_right>>        alinha à direita em 15 caracteres
  <<$variavel_center>>       centraliza em 15 caracteres
  <<include(asset)>>         inclui o conteúdo de outro asset
  <<foreach_ongoing>> ... <</foreach_ongoing>>
                             bloco repetido por ataque em andamento (asset ongoing)
  <<$checkrole_<role>>>      "true" / "false" se o usuário tem a role

ESCapes (aceitos dentro de assets)
  \e  \n  \r  \t  \xNN  \NNN  \\


================================================================================
 SISTEMA / BUILD
================================================================================
<<$uptime>>                  uptime do processo (e.g. "1d 2h 3m 4s")
<<$os>>                      sistema operacional (linux)
<<$arch>>                    arquitetura (x86)
<<$version>>                 versão do build (1.0.0)
<<$build>>                   nome do build (Belzebu CNC)
<<$key>>                     chave do config (ConfigData.Key)
<<$license_expires>>         data de expiração da licença (YYYY-MM-DD)
<<$license_user>>            usuário da licença
<<$idle_timeout>>            idle timeout configurado (segundos)


================================================================================
 USUÁRIO (SESSÃO)
================================================================================
<<$username>>                nome do usuário logado
<<$concurrents>>             concurrents permitidos
<<$timelimit>>               time limit do usuário (segundos)
<<$maxtime>>                 maxtime do usuário (segundos)
<<$cooldown>>                cooldown entre ataques (segundos)
<<$credits>>                 créditos do usuário
<<$remoteaddress>>           endereço remoto (IP:porta)
<<$remoteclient>>            cliente SSH (se disponível)
<<$created_by>>              criado por (alias: <<$createdby>>)
<<$vip>>                     "true"/"false"
<<$reseller>>                "true"/"false"
<<$admin>>                   "true"/"false"
<<$banned>>                  "true"/"false"
<<$api>>                     "true"/"false"
<<$apikey>>                  API key do usuário
<<$expiry>>                  dias restantes como texto (e.g. "30 days")
<<$expirydate>>              data de expiração (YYYY-MM-DD)
<<$expirydays>>              dias restantes (número)


================================================================================
 ROLES
================================================================================
<<$roles>>                   roles do usuário separadas por vírgula (sem espaço)
<<$roles_csv>>               idem, mas "none" quando vazio
<<$user_roles>>              roles separadas por ", " (retorna "none" se vazio)
<<$user_role>>               idem <<$user_roles>> (todas as roles)
<<$checkrole_<role>>>        "true" se o usuário tem a role <role>, senão "false"
                             Ex.: <<$checkrole_admin>>, <<$checkrole_viadao>>
                             <<$checkrole_raw>>


================================================================================
 ESTATÍSTICAS GLOBAIS / CNC
================================================================================
<<$ongoing>>                 ataques em andamento do usuário
<<$onlineusers>>             usuários online agora
<<$allgoing>>                ataques em andamento (global)
<<$allattacks>>              total de ataques desde o início
<<$totalusers>>              total de usuários cadastrados

<<$global_attacks_7days>>    ataques nos últimos 7 dias
<<$global_attacks_30days>>   ataques nos últimos 30 dias
<<$global_attacks_today>>    ataques hoje
<<$global_attacks_lasthour>> ataques na última hora

<<$attacks_7days>>           alias de global_attacks_7days
<<$attacks_30days>>          alias de global_attacks_30days
<<$attacks_today>>           alias de global_attacks_today
<<$attacks_lasthour>>        alias de global_attacks_lasthour

<<$global_concurrents>>      limite global de concurrents (CNC)
<<$global_maxtime>>          teto global de tempo (CNC), 0 = ilimitado
<<$cnc_maxtime>>             alias de global_maxtime
<<$attacks_enabled>>         "true"/"false" — ataques habilitados globalmente


================================================================================
 TOP MÉTODOS (GLOBAL)
================================================================================
Formato: name / count / pct (percentual do total no período)

7 dias:
<<$top_method_global_7_1_name>>   <<$top_method_global_7_1_count>>   <<$top_method_global_7_1_pct>>
<<$top_method_global_7_2_name>>   <<$top_method_global_7_2_count>>   <<$top_method_global_7_2_pct>>
<<$top_method_global_7_3_name>>   <<$top_method_global_7_3_count>>   <<$top_method_global_7_3_pct>>
<<$top_method_global_7_4_name>>   <<$top_method_global_7_4_count>>   <<$top_method_global_7_4_pct>>
<<$top_method_global_7_5_name>>   <<$top_method_global_7_5_count>>   <<$top_method_global_7_5_pct>>

30 dias:
<<$top_method_global_30_1_name>>   <<$top_method_global_30_1_count>>   <<$top_method_global_30_1_pct>>
<<$top_method_global_30_2_name>>   <<$top_method_global_30_2_count>>   <<$top_method_global_30_2_pct>>
<<$top_method_global_30_3_name>>   <<$top_method_global_30_3_count>>   <<$top_method_global_30_3_pct>>
<<$top_method_global_30_4_name>>   <<$top_method_global_30_4_count>>   <<$top_method_global_30_4_pct>>
<<$top_method_global_30_5_name>>   <<$top_method_global_30_5_count>>   <<$top_method_global_30_5_pct>>

Aliases (sem "global_") — mesmos valores:
<<$top_method_7_1_name>> ... <<$top_method_7_5_pct>>
<<$top_method_30_1_name>> ... <<$top_method_30_5_pct>>


================================================================================
 ESTATÍSTICAS DO USUÁRIO
================================================================================
<<$user_total_attacks>>      total de ataques do usuário
<<$user_attacks_today>>      ataques hoje (usuário)
<<$user_attacks_lasthour>>   ataques na última hora (usuário)

Top métodos do usuário:
<<$user_top_method_1_name>>   <<$user_top_method_1_count>>
<<$user_top_method_2_name>>   <<$user_top_method_2_count>>
<<$user_top_method_3_name>>   <<$user_top_method_3_count>>
<<$user_top_method_4_name>>   <<$user_top_method_4_count>>
<<$user_top_method_5_name>>   <<$user_top_method_5_count>>

Top portas do usuário:
<<$user_top_port_1_name>>   <<$user_top_port_1_count>>
<<$user_top_port_2_name>>   <<$user_top_port_2_count>>
<<$user_top_port_3_name>>   <<$user_top_port_3_count>>
<<$user_top_port_4_name>>   <<$user_top_port_4_count>>


================================================================================
 "MOST" (RANKINGS HISTÓRICOS)
================================================================================
<<$most_method1>>  <<$most_method2>>  <<$most_method3>>
<<$most_method4>>  <<$most_method5>>

<<$most_host1>>    <<$most_host2>>    <<$most_host3>>
<<$most_host4>>    <<$most_host5>>

<<$most_user1>>    <<$most_user2>>    <<$most_user3>>
<<$most_user4>>    <<$most_user5>>


================================================================================
 UI / BRANDING
================================================================================
<<$spinner>>                 primeiro spinner configurado
<<$date>>                    data atual (YYYY-MM-DD)
<<$timenow>>                 hora atual (3:04pm)
<<$timezone>>                timezone da sessão
<<$ring>>                    caractere BEL (\a)
<<$clear>>                   sequência ANSI para limpar a tela


================================================================================
 ATAQUE (sessão atual — preenchido por renderAttack)
================================================================================
<<$host>>                    host do ataque
<<$port>>                    porta
<<$time>>                    duração (segundos)
<<$method>>                  método
<<$target_ip>>               IP resolvido
<<$region>>                  região (geoIP)
<<$org>>                     org/ISP (geoIP)
<<$country>>                 país (geoIP)
<<$delay>>                   delay do ataque
<<$botcount>>                contagem de bots (se aplicável)


================================================================================
 ATAQUES EM ANDAMENTO (bloco foreach_ongoing / asset ongoing)
================================================================================
<<$a_method>>                método
<<$a_host>>                  host
<<$a_target_ip>>             IP alvo
<<$a_port>>                  porta
<<$a_time>>                  duração total (segundos)
<<$a_remaining>>             segundos restantes
<<$a_region>>                região
<<$a_org>>                   org/ISP
<<$a_country>>               país
<<$a_id>>                    ID do ataque

Versões com padding fixo (úteis em tabelas):
<<$a_host_padded>>           22 caracteres
<<$a_port_padded>>           6 caracteres
<<$a_time_padded>>           6 caracteres
<<$a_method_padded>>         12 caracteres
<<$a_remaining_padded>>      9 caracteres
<<$a_empty>>                 "  No running attacks." quando vazio


================================================================================
 LOOKUP (preenchido por `lookup <host>`)
================================================================================
<<$lookup_host>>             host consultado
<<$lookup_ip>>               IP resolvido
<<$lookup_country>>          país
<<$lookup_region>>           região
<<$lookup_city>>             cidade
<<$lookup_zip>>              CEP
<<$lookup_org>>              organização
<<$lookup_isp>>              ISP
<<$lookup_asn>>              ASN
<<$lookup_lat>>              latitude
<<$lookup_lon>>              longitude
<<$lookup_timezone>>         timezone
<<$lookup_reverse>>          DNS reverso


================================================================================
 CHAT
================================================================================
O chat não expõe variáveis de template. É uma tela dedicada (alternate screen)
acessada pelo comando `chat`. Dentro do chat:
  - digite + Enter   envia mensagem
  - /clear           limpa o histórico local
  - /quit /exit /q   sai
  - Ctrl+C           sai
Fora do chat, mensagens não lidas aparecem no prompt como [chat:N].


================================================================================
 EXEMPLOS
================================================================================
Banner:
  <<$clear>>Belzebu CNC v<<$version>>
  User: <<$username>>  Roles: <<$user_roles>>
  Cooldown: <<$cooldown>>s  CNC MaxTime: <<$cnc_maxtime>>s

Tabela alinhada:
  <<$username_left>> | <<$vip_right>> | <<$admin_right>>

Condicional por role (mostra só se tiver a role):
  Se você vir isso, tem a role viadao: <<$checkrole_viadao>>