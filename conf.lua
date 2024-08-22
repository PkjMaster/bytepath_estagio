gw = 480 
gh = 270 
sx = 1
sy = 1

function love.conf(t)
    t.identity = nil                   -- O nome do diretório que ficará o save (string)
    t.version = "0.10.2"               -- A versão do LÖVE na qual o jogo foi feito (string)
    t.console = false                  -- Para ligar o console (boolean, somente Windows)
 
    t.window.title = "BYTEPATH"        -- O titulo da janela (string)
    t.window.icon = nil                -- Caminho da imagem que será o icone da janela (string)
    t.window.width = gw                -- O comprimento da janela (number)
    t.window.height = gh               -- A altura da janela (number)
    t.window.borderless = false        -- Remove todos os recursos visuais da borda da tela (boolean)
    t.window.resizable = true          -- Possibilita o usuário mudar o tamanho da tela (boolean)
    t.window.minwidth = 1              -- Comprimento minimo da tela se for redimensionável (number)
    t.window.minheight = 1             -- Altura minima da tela se for redimensionável (number)
    t.window.fullscreen = false        -- Ativa a tela cheia (boolean)
    t.window.fullscreentype = "exclusive" -- Modo tela cheia padrão or tela cheia da area de trabalho(string)
    t.window.vsync = true              -- Habilitar o Vsync(Sincronização Vertical) (boolean)
    t.window.fsaa = 0                  -- O numero de amostras que serão usadas para usar no multi-sampled antialiasing (number)
    t.window.display = 1               -- Indice do monitor que será mostrado a tela (number)
    t.window.highdpi = false           -- Ativa o modo de alto-dpi(dots per inch) para a tela (boolean)
    t.window.srgb = false              -- Ativa a correção da gamma sRGB quando desenhar na tela (boolean)
    t.window.x = nil                   -- A coordenada x da posição da janela especificada na tela (number)
    t.window.y = nil                   -- A coordenada y da posição da janela especificada na tela (number)
 
    t.modules.audio = true             -- Ativa o modulo de áudio (boolean)
    t.modules.event = true             -- Ativa o modulo de evento (boolean)
    t.modules.graphics = true          -- Ativa o modulo gráfico (boolean)
    t.modules.image = true             -- Ativa o modulo de imagem (boolean)
    t.modules.joystick = true          -- Ativa o modulo de joystick (boolean)
    t.modules.keyboard = true          -- Ativa o modulo de teclado (boolean)
    t.modules.math = true              -- Ativa o modulo de matemática (boolean)
    t.modules.mouse = true             -- Ativa o modulo de mouse (boolean)
    t.modules.physics = true           -- Ativa o modulo de física (boolean)
    t.modules.sound = true             -- Ativa o modulo de sons (boolean)
    t.modules.system = true            -- Ativa o modulo de sistema (boolean)
    t.modules.timer = true             -- Ativa o modulo de temporizador (boolean), Ao desativar ele, resultara em um delta time 0 no love.update
    t.modules.window = true            -- Ativa o modulo de janela (boolean)
    t.modules.thread = true            -- Ativa o modulo de thread (boolean)
end