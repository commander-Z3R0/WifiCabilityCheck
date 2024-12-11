#!/bin/bash

b="\e[1m"
w="\e[0m"
r="\e[31m"
d="\e[2m"
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
NC="\e[0m"

logo="$b
                          _cyqyc_
                      :>3qKKKKKKKq3>:
                  ';CpKKKKKKKkKKKKKKKpC;'
              -\"iPKKKKKKkkkCZ3R0KKKKKKKKKKPi\"-
          \`~v]KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK]v~\`
       ,rwKKKKKKKKKKKKKPv;,:'-':,;vPKKKKKKKKKKKKKwr,
      !KKKKKKKKKKKKKKK/             !KKKKKKKKKKKKKKK!
      !KKKKKKKKKKKKKKf       ?       CKKKKKKKKKKKKKK!
      !KKKKKKKKKKKKKp-               -qKKKKKKKKKKKKK!
      !KKKKKKKKKKKKK>\"               \"\\KKKKKKKKKKKKK!
      !KKKKKKKw;,_'-                   .-:,\"wKKKKKKK!
      !KKKKKKKKhi*;\"                   \";*ihKKKKKKKK!
      !KKKKKKKKKKKKK;                 ;KKKKKKKKKKKKK!
      !KKKKKKKKKKKKK2>'             '>2KKKKKKKKKKKKK!
      !KKKKKKKKKKKKKKKZ             ZKKKKKKKKKKKKKKK!
      !KKKKKKKKKKKKKKK5             eKKKKKKKKKKKKKKK!
      !KKKKKKKKKKKqC;-               -;CqKKKKKKKKKKK!
      <KKKKKKKKkr,                       ,rSKKKKKKKK<
       -\"v]qj;-                             -;jq]v\"-
      $w >>-------> [WifiCapabilityChecker]$w
      $d >>------->   by $w$r@Commander.Z3R0$w"

echo -e "$logo"

check_root() {
    if [ "$EUID" -ne 0 ]; then
        case $language in
            en) echo "[!] Please run this script as root." ;;
            es) echo "[!] Por favor, ejecute este script como root." ;;
            fr) echo "[!] Veuillez exécuter ce script en tant que root." ;;
        esac
        exit 1
    fi
}

check_dependencies() {
    for cmd in iw iwconfig aireplay-ng; do
        if ! command -v $cmd &> /dev/null; then
            case $language in
                en) echo -e "${YELLOW}[!] $cmd is not installed. Please install it manually.${NC}" ;;
                es) echo -e "${YELLOW}[!] $cmd no está instalado. Por favor, instálelo manualmente.${NC}" ;;
                fr) echo -e "${YELLOW}[!] $cmd n'est pas installé. Veuillez l'installer manuellement.${NC}" ;;
            esac
        fi
    done
}

list_wifi_interfaces() {
    iw dev | grep Interface | awk '{print $2}'
}

check_monitor_mode() {
    local interface=$1
    case $language in
        en) echo "[?] Checking if $interface can be set to monitor mode..." ;;
        es) echo "[?] Comprobando si $interface puede ser puesto en modo monitor..." ;;
        fr) echo "[?] Vérification si $interface peut être mis en mode moniteur..." ;;
    esac

    ip link set $interface down
    if iwconfig $interface mode monitor 2>/dev/null; then
        case $language in
            en) echo -e "${GREEN}[*] $interface is compatible with monitor mode.${NC}" ;;
            es) echo -e "${GREEN}[*] $interface es compatible con el modo monitor.${NC}" ;;
            fr) echo -e "${GREEN}[*] $interface est compatible avec le mode moniteur.${NC}" ;;
        esac
        ip link set $interface up
    else
        case $language in
            en) echo -e "${RED}[X] $interface is not compatible with monitor mode.${NC}" ;;
            es) echo -e "${RED}[X] $interface no es compatible con el modo monitor.${NC}" ;;
            fr) echo -e "${RED}[X] $interface n'est pas compatible avec le mode moniteur.${NC}" ;;
        esac
    fi
}

check_packet_injection() {
    local interface=$1
    case $language in
        en) echo "[?] Checking if $interface supports packet injection..." ;;
        es) echo "[?] Comprobando si $interface soporta la inyección de paquetes..." ;;
        fr) echo "[?] Vérification si $interface supporte l'injection de paquets..." ;;
    esac

    if aireplay-ng --test $interface | grep -q "Injection is working!"; then
        case $language in
            en) echo -e "${GREEN}[*] Congrats! $interface SUPPORTS INJECTION${NC}" ;;
            es) echo -e "${GREEN}[*] ¡Felicidades! $interface SOPORTA INYECCIÓN${NC}" ;;
            fr) echo -e "${GREEN}[*] Félicitations! $interface SUPPORTE L'INJECTION${NC}" ;;
        esac
    else
        case $language in
            en) echo -e "${RED}[X] Alas! $interface does not support packet injection${NC}" ;;
            es) echo -e "${RED}[X] ¡Lástima! $interface no soporta la inyección de paquetes${NC}" ;;
            fr) echo -e "${RED}[X] Hélas! $interface ne supporte pas l'injection de paquets${NC}" ;;
        esac
    fi
}

echo "Select a language / Seleccione un idioma / Sélectionnez une langue:"
echo "1) English"
echo "2) Español"
echo "3) Français"
read -p "#? " lang_choice

case $lang_choice in
    1) language="en" ;;
    2) language="es" ;;
    3) language="fr" ;;
    *) language="en" ;;
esac

check_root
check_dependencies

interfaces=$(list_wifi_interfaces)
if [ -z "$interfaces" ]; then
    case $language in
        en) echo "No Wi-Fi interfaces found." ;;
        es) echo "No se encontraron interfaces Wi-Fi." ;;
        fr) echo "Aucune interface Wi-Fi trouvée." ;;
    esac
    exit 1
fi

case $language in
    en) echo "Select a Wi-Fi interface from the list:" ;;
    es) echo "Seleccione una interfaz Wi-Fi de la lista:" ;;
    fr) echo "Sélectionnez une interface Wi-Fi dans la liste:" ;;
esac

select interface in $interfaces; do
    if [ -n "$interface" ]; then
        check_monitor_mode $interface
        check_packet_injection $interface
        break
    else
        case $language in
            en) echo "Invalid selection. Please choose a valid number." ;;
            es) echo "Selección inválida. Por favor, elija un número válido." ;;
            fr) echo "Sélection invalide. Veuillez choisir un numéro valide." ;;
        esac
    fi
done
