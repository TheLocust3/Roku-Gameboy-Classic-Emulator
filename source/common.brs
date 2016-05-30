Function To16Bit(left_byte as Integer, right_byte as Integer) as Integer
    Assert8Bit(left_byte)
    Assert8Bit(right_byte)
    
    Return (left_byte << 8) + right_byte
End Function

Function Split16Bit(value_16b as Integer) as Object
    Assert16Bit(value_16b)
    
    byte_array = [ 0, 0 ]
    byte_array[0] = (value_16b and &hFF00) >> 8 
    byte_array[1] = (value_16b and &h00FF)
    
    Return byte_array
end Function

Function GetBitFrom8Bit(value_8b as Integer, bit_number as Integer) as Object
    Assert8Bit(value_8b)
    Assert(bit_number >= 0 and bit_number <= 7)
    
    Return (value_8b and (&h01 << bit_number)) >> bit_number
End Function