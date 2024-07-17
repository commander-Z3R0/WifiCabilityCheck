[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://github.com/commander-z3r0?tab=repositories) 

[Version: 1.0]

#### What is WifiCapabilityCheck?

`wcc.sh` (Wi-Fi Capability Check) is a Bash script designed to help users determine if their Wi-Fi interfaces support monitor mode and packet injection. This is particularly useful for security professionals and enthusiasts who need to ensure their hardware is compatible with specific wireless auditing tasks.

#### Features

- **Language Selection**: The script supports English, Spanish, and French.
- **Wi-Fi Interface Detection**: Lists all available Wi-Fi interfaces.
- **Monitor Mode Check**: Verifies if a Wi-Fi interface can be set to monitor mode.
- **Packet Injection Check**: Tests if a Wi-Fi interface supports packet injection.

#### How to Use

1. **Download the Script**: Save the script as `wcc.sh`.
   ```bash
   git clone https://github.com/commander-z3r0/wcc.git
   ```
   
2. **Make the Script Executable**: 
   ```bash
   chmod +x wcc.sh
   ```

3. **Run the Script as Root**: 
   ```bash
   sudo ./wcc.sh
   ```

4. **Select Language**: When prompted, choose your preferred language (English, Spanish, or French).

5. **Select Wi-Fi Interface**: The script will list all available Wi-Fi interfaces. Select the interface you want to test.

6. **Monitor Mode and Packet Injection Test**: The script will check if the selected interface supports monitor mode and packet injection, and display the results.

#### Example Usage

```bash
❯ sudo ./wccn.sh

                          _cyqyc_
                      :>3qKKKKKKKq3>:
                  ';CpKKKKKKKkKKKKKKKpC;'
              -"iPKKKKKKkkkCZ3R0KKKKKKKKKKPi"-
          `~v]KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK]v~`
       ,rwKKKKKKKKKKKKKPv;,:'-':,;vPKKKKKKKKKKKKKwr,
      !KKKKKKKKKKKKKKK/             !KKKKKKKKKKKKKKK!
      !KKKKKKKKKKKKKKf       ?       CKKKKKKKKKKKKKK!
      !KKKKKKKKKKKKKp-               -qKKKKKKKKKKKKK!
      !KKKKKKKKKKKKK>"               "\KKKKKKKKKKKKK!
      !KKKKKKKw;,_'-                   .-:,"wKKKKKKK!
      !KKKKKKKKhi*;"                   ";*ihKKKKKKKK!
      !KKKKKKKKKKKKK;                 ;KKKKKKKKKKKKK!
      !KKKKKKKKKKKKK2>'             '>2KKKKKKKKKKKKK!
      !KKKKKKKKKKKKKKKZ             ZKKKKKKKKKKKKKKK!
      !KKKKKKKKKKKKKKK5             eKKKKKKKKKKKKKKK!
      !KKKKKKKKKKKqC;-               -;CqKKKKKKKKKKK!
      <KKKKKKKKkr,                       ,rSKKKKKKKK<
       -"v]qj;-                             -;jq]v"-
       >>-------> [WifiCapabilityChecker]
       >>------->       by @C.Z3R0
Select a language / Seleccione un idioma / Sélectionnez une langue:
1) English
2) Español
3) Français
#? 1
Select a Wi-Fi interface from the list:
1) wlan0
#? 1
[?] Checking if wlp3s0 can be set to monitor mode...
[*] wlan0 is compatible with monitor mode.
[?] Checking if wlp3s0 supports packet injection...
[X] Alas! wlan0 does not support packet injection
```

Upon running the script, follow the prompts to select your language and Wi-Fi interface. The script will then provide detailed feedback on the capabilities of your chosen interface.
