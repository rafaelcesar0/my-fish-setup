#!/usr/bin/env fish

# Fish Shell Setup - Instalador Modular
# Permite instalação seletiva ou completa das ferramentas

set SCRIPT_DIR (dirname (realpath (status filename)))

# Lista de tecnologias disponíveis
set -g TOOLS "core-tools" "eza" "oh-my-fish" "starship" "nvm" "pnpm" "bun" "docker" "uv"
set -g TOOL_NAMES "Core Tools (bat, zoxide, fzf)" "eza" "Oh My Fish" "Starship" "NVM" "pnpm" "bun" "Docker Engine" "UV (Python)"
set -g CONFIG_MODULES "config-base.fish" "config-fzf.fish" "config-starship.fish" "config-zoxide.fish" "config-nvm.fish" "config-pnpm.fish" "config-bun.fish" "config-docker.fish" "config-uv.fish"

# Cores para output
set -l GREEN '\033[0;32m'
set -l YELLOW '\033[1;33m'
set -l RED '\033[0;31m'
set -l NC '\033[0m' # No Color

# Handler para Ctrl+C
function handle_interrupt --on-signal SIGINT
    echo
    echo -e "$YELLOW✋ Instalação cancelada pelo usuário.$NC"
    exit 130
end

function show_header
    echo
    echo "🐟 Fish Shell Setup - Instalador Modular"
    echo "========================================"
    echo
end

function show_menu
    echo "Escolha uma opção:"
    echo
    echo "1) Instalação completa (todas as ferramentas)"
    echo "2) Instalação personalizada (escolher ferramentas)"
    echo "3) Listar ferramentas disponíveis"
    echo "4) Sair"
    echo
    echo -e "$YELLOW💡 Pressione Ctrl+C ou digite 'q' para sair a qualquer momento$NC"
    echo
end

function list_tools
    echo "Ferramentas disponíveis:"
    echo
    for i in (seq (count $TOOL_NAMES))
        echo "• $TOOL_NAMES[$i]"
    end
    echo
end

function install_tool
    set -l tool $argv[1]
    set -l script_path "$SCRIPT_DIR/scripts/install-$tool.fish"
    
    if test -f $script_path
        echo -e "$YELLOW→ Executando instalação: $tool$NC"
        if fish $script_path
            echo -e "$GREEN✓ $tool instalado com sucesso!$NC"
            return 0
        else
            echo -e "$RED✗ Falha na instalação: $tool$NC"
            return 1
        end
    else
        echo -e "$RED✗ Script não encontrado: $script_path$NC"
        return 1
    end
end

function custom_installation
    echo "Instalação Personalizada"
    echo "========================"
    echo
    echo "Escolha as ferramentas para instalar (separadas por espaço):"
    
    for i in (seq (count $TOOL_NAMES))
        echo "$i) $TOOL_NAMES[$i]"
    end
    echo
    echo -n "Digite os números (ex: 1 3 5) ou 'q' para cancelar: "
    read -l choices
    
    # Verificar se o usuário quer cancelar
    if test "$choices" = "q" -o "$choices" = "Q"
        echo -e "$YELLOW✋ Instalação cancelada.$NC"
        return 1
    end
    
    set -l selected_tools
    for choice in $choices
        if test $choice -ge 1 -a $choice -le (count $TOOLS)
            set -a selected_tools $TOOLS[$choice]
        end
    end
    
    if test (count $selected_tools) -eq 0
        echo -e "$RED✗ Nenhuma ferramenta selecionada.$NC"
        return 1
    end
    
    echo
    echo "Instalando ferramentas selecionadas..."
    
    set -l failed_installs
    for tool in $selected_tools
        if not install_tool $tool
            set -a failed_installs $tool
        end
    end
    
    # Gerar config.fish final
    generate_config_file $selected_tools
    
    if test (count $failed_installs) -gt 0
        echo -e "$YELLOW⚠ Algumas instalações falharam: $failed_installs$NC"
        return 1
    else
        echo -e "$GREEN✅ Todas as ferramentas foram instaladas com sucesso!$NC"
        return 0
    end
end

function full_installation
    echo "Instalação Completa"
    echo "==================="
    echo
    echo "Instalando todas as ferramentas..."
    
    set -l failed_installs
    for tool in $TOOLS
        if not install_tool $tool
            set -a failed_installs $tool
        end
    end
    
    # Gerar config.fish final com todos os módulos
    generate_config_file $TOOLS
    
    if test (count $failed_installs) -gt 0
        echo -e "$YELLOW⚠ Algumas instalações falharam: $failed_installs$NC"
        return 1
    else
        echo -e "$GREEN✅ Instalação completa finalizada!$NC"
        return 0
    end
end

function generate_config_file
    set -l installed_tools $argv
    
    echo
    echo -e "$YELLOW→ Gerando arquivo de configuração final...$NC"
    
    mkdir -p ~/.config/fish
    
    # Sempre incluir configuração base
    if test -f "$SCRIPT_DIR/config/config-base.fish"
        cat "$SCRIPT_DIR/config/config-base.fish" > ~/.config/fish/config.fish
        echo "" >> ~/.config/fish/config.fish
    end
    
    # Adicionar módulos baseado nas ferramentas instaladas
    for tool in $installed_tools
        switch $tool
            case "core-tools"
                # fzf e zoxide fazem parte das core tools
                append_config_module "config-fzf.fish"
                append_config_module "config-zoxide.fish"
            case "starship"
                append_config_module "config-starship.fish"
            case "pnpm"
                append_config_module "config-pnpm.fish"
            case "bun"
                append_config_module "config-bun.fish"
            case "uv"
                append_config_module "config-uv.fish"
        end
    end
    
    echo -e "$GREEN✓ Arquivo config.fish gerado em ~/.config/fish/config.fish$NC"
end

function append_config_module
    set -l module $argv[1]
    set -l module_path "$SCRIPT_DIR/config/$module"
    
    if test -f $module_path
        echo "# === $module ===" >> ~/.config/fish/config.fish
        cat $module_path >> ~/.config/fish/config.fish
        echo "" >> ~/.config/fish/config.fish
    end
end

function main
    show_header
    
    while true
        show_menu
        echo -n "Escolha uma opção (1-4): "
        read -l choice
        
        switch $choice
            case "1"
                full_installation
                if test $status -eq 0
                    echo
                    echo -e "$GREEN🎉 Para ativar as configurações, execute: exec fish$NC"
                    break
                end
            case "2"
                custom_installation
                if test $status -eq 0
                    echo
                    echo -e "$GREEN🎉 Para ativar as configurações, execute: exec fish$NC"
                    break
                end
            case "3"
                list_tools
            case "4" "q" "Q"
                echo "Saindo..."
                exit 0
            case "*"
                echo -e "$RED✗ Opção inválida. Digite 1, 2, 3, 4 ou 'q' para sair.$NC"
                echo
        end
    end
end

# Executar função principal
main