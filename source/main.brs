Sub Main()
  ' Roku setup
  port = CreateObject("roMessagePort")
  screen = CreateObject("roScreen")
  screen.SetMessagePort(port) ' instruct screen to send events to port
  
  fontreg = createobject("rofontregistry")
  font = fontreg.getdefaultfont()
  
  clock = CreateObject("roTimespan")
  
  ' Gameboy setup
  cpu = CreateCPU()
  
  memory = CreateMemory()
  
  while true
	screen.clear(&h00000000)
  
    msg = port.GetMessage()
    if type(msg) = "roUniversalControlEvent" then
        ' msg.getInt()
    endif
    
    screen.drawpoint(1, 1, 100, &hFFFFFFFF)
        
    screen.SwapBuffers()
  end while
End Sub
