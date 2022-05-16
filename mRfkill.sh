#!/bin/bash
source "sRfkill.sh"
 HEAD(){ for (( a=2; a<=29; a++ ))
  do
 TPUT $a 1
  $E "\e[1;31m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 3
  $E "\e[1;36m rfkill\e[0m";
 TPUT 4 3
  $E "\e[90m инструмент для включения и отключения беспроводных устройств\e[0m";
 TPUT 5 1
  $E "\e[31m+--------------------------------------------------------------------------------+\e[0m";
 TPUT 12 1
  $E "\e[31m+- Options ------------------------------------------- Опции --------------------+\e[0m";
 TPUT 20 1
  $E "\e[31m+- Commands ------------------------------------------ Команды ------------------+\e[0m";
 TPUT 26 1
  $E "\e[0m\033[31m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 30 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Kраткий обзор                                      \e[32m Synopsis                \e[0m";}
  M1(){ TPUT  7 3; $e " Описание                                           \e[32m Description             \e[0m";}
  M2(){ TPUT  8 3; $e " Авторы                                             \e[32m Authors                 \e[0m";}
  M3(){ TPUT  9 3; $e " Смотрите также                                     \e[32m See Also                \e[0m";}
  M4(){ TPUT 10 3; $e " Доступность                                        \e[32m Availability            \e[0m";}
  M5(){ TPUT 11 3; $e " Установка                                          \e[32m install                 \e[0m";}
#
  M6(){ TPUT 13 3; $e " Используйте выходной формат JSON                   \e[32m -J --json               \e[0m";}
  M7(){ TPUT 14 3; $e " Не печатайте строку заголовка                      \e[32m -n --noheadings         \e[0m";}
  M8(){ TPUT 15 3; $e " Укажите, какие выходные столбцы следует печатать   \e[32m -o --output             \e[0m";}
  M9(){ TPUT 16 3; $e " Вывести все доступные столбцы                      \e[32m    --output-all         \e[0m";}
 M10(){ TPUT 17 3; $e " Используйте необработанный формат вывода           \e[32m -r --raw                \e[0m";}
 M11(){ TPUT 18 3; $e " Показать текст справки и выйти                     \e[32m    --help               \e[0m";}
 M12(){ TPUT 19 3; $e " Показать информацию о версии и выйти               \e[32m    --version            \e[0m";}
#
 M13(){ TPUT 21 3; $e " Показать текст справки и выйти                     \e[32m help                    \e[0m";}
 M14(){ TPUT 22 3; $e " Прослушивание событий                              \e[32m event                   \e[0m";}
 M15(){ TPUT 23 3; $e " Список текущего состояния всех доступных устройств \e[32m list [id|type ...]      \e[0m";}
 M16(){ TPUT 24 3; $e " Заблокировать  беспроводноe устройствo             \e[32m block id|type [...]     \e[0m";}
 M17(){ TPUT 25 3; $e " Разблокировать беспроводноe устройство             \e[32m unblock id|type [...]   \e[0m";}
#
 M18(){ TPUT 27 3; $e "\e[32m Grannik Git                                                                 \e[0m";}
 M19(){ TPUT 28 3; $e "\e[32m Exit                                                                        \e[0m";}
LM=19
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m rfkill [options] [command] [id|type ...]\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo " Cписки rfkill, включение и отключение беспроводных устройств.
 Утилита, которая позволяет определить состояние: WiFi, Bluetooth, GPS и прочих
 интегрированных устройств. Bключены они или выключены, программно и аппаратно,
 а также изменить это состояние.
 Это подсистема в ядре Linux, которая предоставляет интерфейс, через который
 радиопередатчики в компьютерной системе могут запрашиваться, активироваться
 и деактивироваться.
 Выходной формат команды «список» устарел и поддерживается только для обратной
 совместимости.
 Новый формат вывода используется по умолчанию, если нет указанной команды или
 когда используется опция --output.
 Выход по умолчанию может быть изменен. Поэтому, когда это возможно, вы должны
 избегать использования выходных данных по умолчанию в своих скриптах.
 Всегда явно определяйте ожидаемые столбцы с помощью параметра --output вместе
 со списком столбцов в средах, где требуется стабильный вывод.";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Первоначально rfkill был написан Йоханнесом Бергом: \e[36mjohannes@sipsolutions.net\e[0m
 и Марселем Холтманном:\e[36m marcel@holtmann.org\e[0m
 Позже код был изменен Сами Керола:\e[36m kerolasa@iki.fi\e[0m
 и Карел Зак:\e[36m kzak@redhat.com\e[0m
 за проект util-linux.
 Эта страница руководства была написана Дарреном Солтом:
\e[36m linux@youmustbejoking.demon.co.uk\e[0m
 для проекта Debian (и может использоваться другими).
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 powertop,  systemd-rfkill,
 Linux kernel documentation:
\e[36m https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/rfkill.rst\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Команда rfkill является частью пакета util-linux и доступна в архиве ядра Linux:
\e[36m https://www.kernel.org/pub/linux/utils/util-linux/\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m sudo apt install rfkill\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e " Используйте выходной формат JSON";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e " Не печатайте строку заголовка";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Укажите, какие выходные столбцы следует печатать.
 Используйте --help, чтобы получить список доступных столбцов:
\e[32m rfkill --output ID,TYPE\e[0m
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e " Вывести все доступные столбцы.";ES;fi;;
 10) S=M10;SC; if [[ $cur == enter ]];then R;echo -e " Используйте необработанный формат вывода";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Показать текст справки и выйти:
\e[32m rfkill --help\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Показать информацию о версии и выйти:
\e[32m rfkill --version\e[0m
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e " Показать текст справки и выйти";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Слушайте события rfkill и отображайте их на стандартном выходе:
\e[32m rfkill event\e[0m
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Показать cписок текущего состояния всех доступных устройств сокращённо:
\e[32m rfkill\e[0m

 Поробно:
\e[32m rfkill list\e[0m

 Специальная строка all типов будет соответствовать всем:
\e[32m sudo rfkill list all\e[0m

 Используйте команду rfkill list, чтобы получить список устройств,
 каждое из которых содержит связанный с ним порядковый номер, начиная с 0.

 Поддерживается использование аргументов mul id или type.
 Формат вывода команды устарел, см. раздел ОПИСАНИЕ.
 Перед настройкой блокировки или разблокировки рекомендуется проверить с помощью
 списка идентификатор команды или тип области действия.
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Отключите соответствующее устройство
\e[32m rfkill block 0\e[0m

 Заблокировать bluetooth:
\e[32m rfkill block bluetooth\e[0m

 Заблокировать wlan:
\e[32m rfkill block wlan\e[0m

 Заблокировать все устройства:
\e[32m rfkill block all\e[0m
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Включите соответствующее устройство:
\e[32m rfkill unblock 0\e[0m

 Pазблокировать bluetooth:
\e[32m rfkill unblock bluetooth\e[0m

 Pазблокировать wlan:
\e[32m rfkill unblock wlan\e[0m

 Pазлокировать все устройства:
\e[32m rfkill unblock all\e[0m

 Если устройство жестко заблокировано, например, с помощью аппаратного
 переключателя, оно останется недоступным, несмотря на программную разблокировку.
";ES;fi;;
#
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 mRfkill - программа, oписание утилиты линукс терминала rfkill.
 rfkill  - инструмент для включения и отключения беспроводных устройств.
\e[36m
 Asciinema  : https://asciinema.org/a/494655
 Gogs       : https://try.gogs.io/Grannik/mRfkill
 Gitea      : https://try.gitea.io/Grannik/mRfkill
 Framagit   : https://framagit.org/GrannikOleg/mrfkill
 Bitbucket  : https://bitbucket.org/grannikoleg/workspace/projects/MRFKIL
 Codeberg   : https://codeberg.org/Grannik/mRfkill
 Notabug    : https://notabug.org/Grannikoleg/mRfkill
 Sourceforge: https://sourceforge.net/projects/mrfkill/files/
 Gitlab     : https://gitlab.com/grannik/mrfkill
 Github     : https://github.com/GrannikOleg/mRfkill
\e[0m";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
