Function CreateSpecial16BRegister(initial_value as Integer) as Object
    obj = {
        CLASS_TYPE  : "SPECIAL_16B_REGISTER"
        value       : 0
        
        Init        : Function(initial_value as Integer) as Void
            m.Set(initial_value)
        End Function
        
        Get         : Function() as Integer
            Return m.value
        End Function
        
        Set         : Function(new_value as Integer) as Void
            Assert16Bit(new_value)
            
            m.value = new_value
        End Function
    }
    
    obj.Init(initial_value)
    
    Return obj
End Function
