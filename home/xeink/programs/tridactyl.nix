{ pkgs, ... }:

{
  xdg.configFile."tridactyl/tridactylrc".text = ''
    " --- Интерфейс и Тема ---
    set theme dark
    set hintmode alphanumeric

    " --- Поведение ---
    " Автоматически копировать выделенный текст
    set selectioncareless true
    " Использовать nvim в терминале kitty для редактирования текстовых полей (Ctrl+i)
    set editorcmd kitty nvim

    " --- Горячие клавиши (Binds) ---
    " jj для выхода в нормальный режим из режима ввода (как в Vim)
    nm jj <Esc>

    " Переключение вкладок через J и K (удобнее, чем gt/gT)
    bind J tabnext
    bind K tabprev

    " Удобный поиск по закладкам и истории через Ctrl+f
    bind <C-f> bmarks

    " Быстрый поиск (Shift+S)
    bind S open google

    " --- Санитайзер ---
    " Очистка URL от мусора при копировании ссылки (yy)
    set yankrooturl true
  '';
}
