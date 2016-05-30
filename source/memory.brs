Function CreateMemory() as Object
    obj = {
        CLASS_TYPE  : "MEMORY"
        ram         : []
        
        Init        : Function() as Void
            ' initialize all values to 0
            For i = 0 To &hFFFF Step 1 ' 0xFFFF is the highest addressable ram value
                m.Write(0, i)
            End For
        End Function
        
        Read         : Function(address as Integer) as Integer
            Assert(address <= &hFFFF)
            
            Return m.ram[address]
        End Function
        
        Write         : Function(new_value as Integer, address as Integer) as Void
            Assert8Bit(new_value)
            Assert(address <= &hFFFF)
            
            m.ram[address] = new_value
            
            ' 0xE000 - 0xFE00 is mirrored by 0xC000-0xDE00
            If (address >= &hE000) and (address <= &hFE00) Then
                m.ram[address - &h2000] = new_value
            ElseIf (address >= &hC000) and (address <= &hDE00) Then
                m.ram[address + &h2000] = new_value
            End If
        End Function
        
        Read16Bit     : Function(address as Integer) as Integer
            Return To16Bit(m.Read(address), m.Read(address + 1))
        End Function
        
        Write16Bit    : Function(new_value as Integer, address as Integer) as Void
            Assert16Bit(new_value)
            
            byte_array = Split16Bit(new_value)
            m.Write(byte_array[0], address)
            m.Write(byte_array[1], address)
        End Function
    }
    
    obj.Init()
    
    Return obj
End Function