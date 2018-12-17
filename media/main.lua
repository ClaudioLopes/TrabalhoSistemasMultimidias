local conter = 5

-- Funcao de tratamento de eventos:
function handler (evt)
  if (evt.class == 'ncl' and evt.type == 'attribution' and evt.name=='verifica' and evt.action == 'start')then
      local handle = io.popen("ls | wc -l")
      local result = handle:read("*a")
      handle:close()
      print("resalt:" .. result)
      local i = (tonumber(result))
        if (i > conter) then
            conter = conter + 1
            event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'iniciaB',
        action = 'start'
     }
        end
     event.post{
        class = 'ncl',
        type = 'attribution',
        action = 'stop',
     }
  end
end

function handler1(evt)
  if (evt.class == 'ncl' and evt.type == 'attribution' and evt.name=='iniciaBolinha' and evt.action == 'start')then
    if (conter == 6) then
      event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'inicia3',
        action = 'start'
      }
    end
    if (conter == 7) then
    print("Video 2")
      event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'inicia2',
        action = 'start'
      }
    end
    if (conter == 8) then
      event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'inicia1',
        action = 'start'
      }
    end
  end
  event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'iniciaB',
        action = 'stop'
  }
end

function handler2 (evt)
  if (evt.class == 'ncl' and evt.type == 'presentation' and evt.label=='inicia2' and evt.action == 'start')then
    print("fim apresentação inicia3")
    event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'inicia2',
        action = 'stop'
     }
     io.popen("sleep 35;mv Lance.mp4 lance3.mp4")
  end
end

function handler3 (evt)
  if (evt.class == 'ncl' and evt.type == 'presentation' and evt.label=='inicia1' and evt.action == 'start')then
    print("fim apresentação inicia3")
    event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'inicia1',
        action = 'stop'
     }
     io.popen("sleep 35;mv Lance.mp4 lance2.mp4")
  end
end

function handler4 (evt)
  if (evt.class == 'ncl' and evt.type == 'presentation' and evt.label=='inicia3' and evt.action == 'start')then
    print("fim apresentação inicia3")
    event.post{
        class = 'ncl',
        type = 'presentation',
        label = 'inicia3',
        action = 'stop'
     }
     io.popen("sleep 35;mv Lance.mp4 lance1.mp4")
  end
  
end

event.register(handler)
event.register(handler1)
event.register(handler2)
event.register(handler3)
event.register(handler4)