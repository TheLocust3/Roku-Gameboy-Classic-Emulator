Function CreateFlagRegister(register as Object) as Object
    obj = {
        CLASS_TYPE  : "FLAG_REGISTER"
        register    : 0
        
        Init        : Function(register as Object) as Void
            AssertClassType(register, "REGISTER")   
            m.register = register
        End Function
        
        Get         : Function() as Integer
            Return m.register.Get()
        End Function
        
        Set         : Function(new_value as Integer) as Void
            m.register.Set(new_value)
        End Function
        
        GetZeroFlag : Function() as Boolean
            Return GetBitFrom8Bit(m.Get(), 7) = 1
        End Function
        
        GetSubtractFlag: Function() as Boolean
            Return GetBitFrom8Bit(m.Get(), 6) = 1
        End Function
        
        GetHalfCarryFlag: Function() as Boolean
            Return GetBitFrom8Bit(m.Get(), 5) = 1
        End Function
        
        GetCarryFlag: Function() as Boolean
            Return GetBitFrom8Bit(m.Get(), 4) = 1
        End Function
    }
    
    obj.Init(register)
    
    Return obj
End Function
