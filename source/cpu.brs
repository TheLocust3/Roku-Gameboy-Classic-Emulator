Function CreateCPU() as Object
    obj = {
        CLASS_TYPE  : "CPU"
        
        Init        : Function() as Void
          m.Register_a = CreateRegister()
          m.Register_b = CreateRegister()
          m.Register_c = CreateRegister()
          m.Register_d = CreateRegister()
          m.Register_e = CreateRegister()
          m.Register_h = CreateRegister()
          m.Register_l = CreateRegister()
          m.Register_f = CreateRegister() ' Special flag register
          
          m.Flag_register = CreateFlagRegister(m.Register_f)
          
          m.Register_af = Create16BRegister(m.Register_a, m.Register_f)
          m.Register_bc = Create16BRegister(m.Register_b, m.Register_c)
          m.Register_de = Create16BRegister(m.Register_d, m.Register_e)
          m.Register_hl = Create16BRegister(m.Register_h, m.Register_l)
          
          m.Register_sp = CreateSpecial16BRegister(&hFFEE)
          m.Register_pc = CreateSpecial16BRegister(&h100)
          
          m.dispatcher = CreateDispatcher()
        End Function
        
        RunCycle    : Function() as Void
            m.dispatcher.dispatch()
        End Function
    }
    
    obj.Init()
    
    Return obj
End Function
